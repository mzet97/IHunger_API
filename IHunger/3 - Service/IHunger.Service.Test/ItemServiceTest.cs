using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using System.Linq.Expressions;
using Xunit;

namespace IHunger.Service.Test
{
    public class ItemServiceTest
    {
        private readonly Mock<IItemRepository> _itemRepoMock;
        private readonly Mock<IProductRepository> _productRepoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly ItemService _service;

        public ItemServiceTest()
        {
            _itemRepoMock = new Mock<IItemRepository>();
            _productRepoMock = new Mock<IProductRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new ItemService(_itemRepoMock.Object, _productRepoMock.Object, _notifierMock.Object);
        }

        private Item CreateValidItem()
        {
            return new Item
            {
                Id = Guid.NewGuid(),
                IdProduct = Guid.NewGuid(),
                IdOrder = Guid.NewGuid(),
                Quantity = 2,
                Price = 50.00m,
                CreatedAt = DateTime.Now
            };
        }

        private Product CreateValidProduct()
        {
            return new Product
            {
                Id = Guid.NewGuid(),
                Name = "Test Product",
                Price = 25.00m,
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns item")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task GetById_ReturnsItem()
        {
            var item = CreateValidItem();
            _itemRepoMock.Setup(r => r.GetById(item.Id)).ReturnsAsync(item);

            var result = await _service.GetById(item.Id);

            Assert.NotNull(result);
            Assert.Equal(item.Id, result.Id);
        }

        [Fact(DisplayName = "GetByOrder returns items")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task GetByOrder_ReturnsItems()
        {
            var orderId = Guid.NewGuid();
            var items = new List<Item> { CreateValidItem(), CreateValidItem() };
            _itemRepoMock.Setup(r => r.Search(It.IsAny<Expression<Func<Item, bool>>>(), null, null, null))
                .ReturnsAsync(items);

            var result = await _service.GetByOrder(orderId);

            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }

        [Fact(DisplayName = "Create valid item succeeds")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Create_ValidItem_Succeeds()
        {
            var item = CreateValidItem();
            var product = CreateValidProduct();
            item.IdProduct = product.Id;

            _productRepoMock.Setup(r => r.GetById(product.Id)).ReturnsAsync(product);
            _itemRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(item);

            Assert.NotNull(result);
            Assert.Equal(product.Price * item.Quantity, result.Price);
            _itemRepoMock.Verify(r => r.Add(It.IsAny<Item>()), Times.Once);
        }

        [Fact(DisplayName = "Create item with invalid product notifies error")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Create_InvalidProduct_NotifiesError()
        {
            var item = CreateValidItem();
            _productRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Product)null);

            var result = await _service.Create(item);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Create item with zero quantity notifies error")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Create_ZeroQuantity_NotifiesError()
        {
            var item = CreateValidItem();
            item.Quantity = 0;
            var product = CreateValidProduct();
            _productRepoMock.Setup(r => r.GetById(item.IdProduct)).ReturnsAsync(product);

            var result = await _service.Create(item);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing item succeeds")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Update_ExistingItem_Succeeds()
        {
            var item = CreateValidItem();
            var existing = CreateValidItem();
            existing.Id = item.Id;
            var product = CreateValidProduct();

            _itemRepoMock.Setup(r => r.GetById(item.Id)).ReturnsAsync(existing);
            _productRepoMock.Setup(r => r.GetById(item.IdProduct)).ReturnsAsync(product);
            _itemRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(item);

            Assert.NotNull(result);
            _itemRepoMock.Verify(r => r.Update(It.IsAny<Item>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing item succeeds")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Delete_ExistingItem_Succeeds()
        {
            var item = CreateValidItem();
            _itemRepoMock.Setup(r => r.GetById(item.Id)).ReturnsAsync(item);
            _itemRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(item.Id);

            Assert.NotNull(result);
            _itemRepoMock.Verify(r => r.Remove(item.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing item notifies error")]
        [Trait("ItemServiceTest", "Item Service Tests")]
        public async Task Delete_NonExistingItem_NotifiesError()
        {
            _itemRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Item)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
