using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using System.Linq.Expressions;
using Xunit;

namespace IHunger.Service.Test
{
    public class ProductServiceTest
    {
        private readonly Mock<IProductRepository> _productRepoMock;
        private readonly Mock<IRestaurantRepository> _restaurantRepoMock;
        private readonly Mock<ICategoryProductRepository> _categoryRepoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly ProductService _service;

        public ProductServiceTest()
        {
            _productRepoMock = new Mock<IProductRepository>();
            _restaurantRepoMock = new Mock<IRestaurantRepository>();
            _categoryRepoMock = new Mock<ICategoryProductRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new ProductService(
                _notifierMock.Object,
                _productRepoMock.Object,
                _restaurantRepoMock.Object,
                _categoryRepoMock.Object);
        }

        private Product CreateValidProduct()
        {
            return new Product
            {
                Id = Guid.NewGuid(),
                Name = "Test Product",
                Description = "Test Description",
                Price = 29.99m,
                IdRestaurant = Guid.NewGuid(),
                IdCategoryProduct = Guid.NewGuid(),
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns product")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task GetById_ReturnsProduct()
        {
            var product = CreateValidProduct();
            _productRepoMock.Setup(r => r.GetById(product.Id)).ReturnsAsync(product);

            var result = await _service.GetById(product.Id);

            Assert.NotNull(result);
            Assert.Equal(product.Id, result.Id);
        }

        [Fact(DisplayName = "GetAll returns list")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task GetAll_ReturnsList()
        {
            var products = new List<Product> { CreateValidProduct(), CreateValidProduct() };
            _productRepoMock.Setup(r => r.GetAll()).ReturnsAsync(products);

            var result = await _service.GetAll();

            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }

        [Fact(DisplayName = "Create valid product succeeds")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task Create_ValidProduct_Succeeds()
        {
            var product = CreateValidProduct();
            var restaurant = new Restaurant { Id = product.IdRestaurant, CreatedAt = DateTime.Now };
            var category = new CategoryProduct { Id = product.IdCategoryProduct, CreatedAt = DateTime.Now };

            _restaurantRepoMock.Setup(r => r.GetById(product.IdRestaurant)).ReturnsAsync(restaurant);
            _categoryRepoMock.Setup(r => r.GetById(product.IdCategoryProduct)).ReturnsAsync(category);
            _productRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(product);

            Assert.NotNull(result);
            _productRepoMock.Verify(r => r.Add(It.IsAny<Product>()), Times.Once);
        }

        [Fact(DisplayName = "Create product with invalid restaurant notifies error")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task Create_InvalidRestaurant_NotifiesError()
        {
            var product = CreateValidProduct();
            _restaurantRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Restaurant)null);

            var result = await _service.Create(product);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Create product with invalid category notifies error")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task Create_InvalidCategory_NotifiesError()
        {
            var product = CreateValidProduct();
            var restaurant = new Restaurant { Id = product.IdRestaurant, CreatedAt = DateTime.Now };
            _restaurantRepoMock.Setup(r => r.GetById(product.IdRestaurant)).ReturnsAsync(restaurant);
            _categoryRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((CategoryProduct)null);

            var result = await _service.Create(product);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing product succeeds")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task Delete_ExistingProduct_Succeeds()
        {
            var product = CreateValidProduct();
            _productRepoMock.Setup(r => r.GetById(product.Id)).ReturnsAsync(product);
            _productRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(product.Id);

            Assert.NotNull(result);
            _productRepoMock.Verify(r => r.Remove(product.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing product notifies error")]
        [Trait("ProductServiceTest", "Product Service Tests")]
        public async Task Delete_NonExistingProduct_NotifiesError()
        {
            _productRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Product)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
