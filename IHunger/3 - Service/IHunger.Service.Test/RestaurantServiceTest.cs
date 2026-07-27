using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using System.Linq.Expressions;
using Xunit;

namespace IHunger.Service.Test
{
    public class RestaurantServiceTest
    {
        private readonly Mock<IRestaurantRepository> _restaurantRepoMock;
        private readonly Mock<ICategoryRestaurantRepository> _categoryRepoMock;
        private readonly Mock<IAddressRestaurantRepository> _addressRepoMock;
        private readonly Mock<IProductRepository> _productRepoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly RestaurantService _service;

        public RestaurantServiceTest()
        {
            _restaurantRepoMock = new Mock<IRestaurantRepository>();
            _categoryRepoMock = new Mock<ICategoryRestaurantRepository>();
            _addressRepoMock = new Mock<IAddressRestaurantRepository>();
            _productRepoMock = new Mock<IProductRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new RestaurantService(
                _notifierMock.Object,
                _restaurantRepoMock.Object,
                _categoryRepoMock.Object,
                _addressRepoMock.Object,
                _productRepoMock.Object);
        }

        private Restaurant CreateValidRestaurant()
        {
            return new Restaurant
            {
                Id = Guid.NewGuid(),
                Name = "Test Restaurant",
                Description = "Test Description",
                IdCategoryRestaurant = Guid.NewGuid(),
                IdAddressRestaurant = Guid.NewGuid(),
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns restaurant")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task GetById_ReturnsRestaurant()
        {
            var restaurant = CreateValidRestaurant();
            _restaurantRepoMock.Setup(r => r.GetById(restaurant.Id)).ReturnsAsync(restaurant);

            var result = await _service.GetById(restaurant.Id);

            Assert.NotNull(result);
            Assert.Equal(restaurant.Id, result.Id);
        }

        [Fact(DisplayName = "GetAll returns list")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task GetAll_ReturnsList()
        {
            var restaurants = new List<Restaurant> { CreateValidRestaurant(), CreateValidRestaurant() };
            _restaurantRepoMock.Setup(r => r.GetAll()).ReturnsAsync(restaurants);

            var result = await _service.GetAll();

            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }

        [Fact(DisplayName = "Create valid restaurant succeeds")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Create_ValidRestaurant_Succeeds()
        {
            var restaurant = CreateValidRestaurant();
            var category = new CategoryRestaurant { Id = restaurant.IdCategoryRestaurant, CreatedAt = DateTime.Now };
            var address = new AddressRestaurant { Id = restaurant.IdAddressRestaurant, CreatedAt = DateTime.Now };

            _categoryRepoMock.Setup(r => r.GetById(restaurant.IdCategoryRestaurant)).ReturnsAsync(category);
            _addressRepoMock.Setup(r => r.GetById(restaurant.IdAddressRestaurant)).ReturnsAsync(address);
            _restaurantRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(restaurant);

            Assert.NotNull(result);
            _restaurantRepoMock.Verify(r => r.Add(It.IsAny<Restaurant>()), Times.Once);
        }

        [Fact(DisplayName = "Create restaurant with invalid category notifies error")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Create_InvalidCategory_NotifiesError()
        {
            var restaurant = CreateValidRestaurant();
            _categoryRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((CategoryRestaurant)null);

            var result = await _service.Create(restaurant);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing restaurant succeeds")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Update_ExistingRestaurant_Succeeds()
        {
            var restaurant = CreateValidRestaurant();
            var existing = CreateValidRestaurant();
            existing.Id = restaurant.Id;

            _restaurantRepoMock.Setup(r => r.GetById(restaurant.Id)).ReturnsAsync(existing);
            _restaurantRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(restaurant);

            Assert.NotNull(result);
            _restaurantRepoMock.Verify(r => r.Update(It.IsAny<Restaurant>()), Times.Once);
        }

        [Fact(DisplayName = "Update non-existing restaurant notifies error")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Update_NonExistingRestaurant_NotifiesError()
        {
            var restaurant = CreateValidRestaurant();
            _restaurantRepoMock.Setup(r => r.GetById(restaurant.Id)).ReturnsAsync((Restaurant)null);

            var result = await _service.Update(restaurant);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing restaurant succeeds")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Delete_ExistingRestaurant_Succeeds()
        {
            var restaurant = CreateValidRestaurant();
            _restaurantRepoMock.Setup(r => r.GetById(restaurant.Id)).ReturnsAsync(restaurant);
            _restaurantRepoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(restaurant.Id);

            Assert.NotNull(result);
            _restaurantRepoMock.Verify(r => r.Remove(restaurant.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing restaurant notifies error")]
        [Trait("RestaurantServiceTest", "Restaurant Service Tests")]
        public async Task Delete_NonExistingRestaurant_NotifiesError()
        {
            _restaurantRepoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Restaurant)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
