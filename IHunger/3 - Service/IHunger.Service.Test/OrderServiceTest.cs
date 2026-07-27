using IHunger.Domain.Enumeration;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.ViewModels.Order;
using Moq;
using System.Linq.Expressions;
using Xunit;

namespace IHunger.Service.Test
{
    public class OrderServiceTest
    {
        private readonly Mock<IOrderRepository> _orderRepoMock;
        private readonly Mock<IProductRepository> _productRepoMock;
        private readonly Mock<IProfileUserRepository> _profileRepoMock;
        private readonly Mock<ICouponRepository> _couponRepoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly OrderService _service;

        public OrderServiceTest()
        {
            _orderRepoMock = new Mock<IOrderRepository>();
            _productRepoMock = new Mock<IProductRepository>();
            _profileRepoMock = new Mock<IProfileUserRepository>();
            _couponRepoMock = new Mock<ICouponRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new OrderService(
                _orderRepoMock.Object,
                _productRepoMock.Object,
                _profileRepoMock.Object,
                _couponRepoMock.Object,
                _notifierMock.Object);
        }

        private Order CreateValidOrder()
        {
            return new Order
            {
                Id = Guid.NewGuid(),
                OrderStatus = TypeOrderStatus.WaitingForPayment,
                Price = 100.00m,
                Items = new List<Item>
                {
                    new Item { Id = Guid.NewGuid(), IdProduct = Guid.NewGuid(), Quantity = 2, Price = 50.00m }
                },
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns order")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task GetById_ReturnsOrder()
        {
            var order = CreateValidOrder();
            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);

            var result = await _service.GetById(order.Id);

            Assert.NotNull(result);
            Assert.Equal(order.Id, result.Id);
        }

        [Fact(DisplayName = "GetAllWithFilter returns filtered list")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task GetAllWithFilter_ReturnsFilteredList()
        {
            var orders = new List<Order> { CreateValidOrder() };
            var filter = new OrderFilter { PageSize = 10, PageIndex = 0 };

            _orderRepoMock.Setup(r => r.Search(It.IsAny<Expression<Func<Order, bool>>>(), null, filter.PageSize, filter.PageIndex))
                .ReturnsAsync(orders);

            var result = await _service.GetAllWithFilter(filter);

            Assert.NotNull(result);
            Assert.Single(result);
        }

        [Fact(DisplayName = "Update status succeeds")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task UpdateStatus_Succeeds()
        {
            var order = CreateValidOrder();
            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);
            _orderRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.UpdateStatus(order.Id, TypeOrderStatus.Paid);

            Assert.NotNull(result);
            Assert.Equal(TypeOrderStatus.Paid, result.OrderStatus);
            _orderRepoMock.Verify(r => r.Update(It.IsAny<Order>()), Times.Once);
        }

        [Fact(DisplayName = "Update status non-existing notifies error")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task UpdateStatus_NonExisting_NotifiesError()
        {
            _orderRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Order)null);

            var result = await _service.UpdateStatus(Guid.NewGuid(), TypeOrderStatus.Paid);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Add item to order succeeds")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task AddItem_Succeeds()
        {
            var order = CreateValidOrder();
            var product = new Product { Id = Guid.NewGuid(), Price = 25.00m };
            var item = new Item { Id = Guid.NewGuid(), IdProduct = product.Id, Quantity = 2 };

            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);
            _productRepoMock.Setup(r => r.GetById(product.Id)).ReturnsAsync(product);
            _orderRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.AddItem(order.Id, item);

            Assert.NotNull(result);
            Assert.True(result.Items.Count > 0);
        }

        [Fact(DisplayName = "Add item with invalid product notifies error")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task AddItem_InvalidProduct_NotifiesError()
        {
            var order = CreateValidOrder();
            var item = new Item { Id = Guid.NewGuid(), IdProduct = Guid.NewGuid(), Quantity = 1 };

            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);
            _productRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Product)null);

            var result = await _service.AddItem(order.Id, item);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Remove item from order succeeds")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task RemoveItem_Succeeds()
        {
            var order = CreateValidOrder();
            var itemId = order.Items.First().Id;

            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);
            _orderRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.RemoveItem(order.Id, itemId);

            Assert.NotNull(result);
            Assert.True(result.Items.Count == 0);
        }

        [Fact(DisplayName = "Remove non-existing item notifies error")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task RemoveItem_NonExisting_NotifiesError()
        {
            var order = CreateValidOrder();
            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);

            var result = await _service.RemoveItem(order.Id, Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing order succeeds")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task Update_Existing_Succeeds()
        {
            var order = CreateValidOrder();
            var existing = CreateValidOrder();
            existing.Id = order.Id;

            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(existing);
            _orderRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(order);

            Assert.NotNull(result);
            _orderRepoMock.Verify(r => r.Update(It.IsAny<Order>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing order succeeds")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task Delete_Existing_Succeeds()
        {
            var order = CreateValidOrder();
            _orderRepoMock.Setup(r => r.GetById(order.Id)).ReturnsAsync(order);
            _orderRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(order.Id);

            Assert.NotNull(result);
            _orderRepoMock.Verify(r => r.Remove(order.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing notifies error")]
        [Trait("OrderServiceTest", "Order Service Tests")]
        public async Task Delete_NonExisting_NotifiesError()
        {
            _orderRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Order)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
