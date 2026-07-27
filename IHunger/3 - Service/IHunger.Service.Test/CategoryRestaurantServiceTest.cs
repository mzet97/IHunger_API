using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using System.Linq.Expressions;
using Xunit;

namespace IHunger.Service.Test
{
    public class CategoryRestaurantServiceTest
    {
        private readonly Mock<ICategoryRestaurantRepository> _repositoryMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly CategoryRestaurantService _service;

        public CategoryRestaurantServiceTest()
        {
            _repositoryMock = new Mock<ICategoryRestaurantRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new CategoryRestaurantService(_notifierMock.Object, _repositoryMock.Object);
        }

        private CategoryRestaurant CreateValid()
        {
            return new CategoryRestaurant
            {
                Id = Guid.NewGuid(),
                Name = Faker.Name.First(),
                Description = Faker.Lorem.Sentence(),
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns entity")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task GetById_ReturnsEntity()
        {
            var entity = CreateValid();
            _repositoryMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(entity);

            var result = await _service.GetById(entity.Id);

            Assert.NotNull(result);
            Assert.Equal(entity.Id, result.Id);
        }

        [Fact(DisplayName = "Create valid entity succeeds")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task Create_Valid_Succeeds()
        {
            var entity = CreateValid();
            _repositoryMock.Setup(r => r.Search(It.IsAny<Expression<Func<CategoryRestaurant, bool>>>(), null, null, null))
                .ReturnsAsync(new List<CategoryRestaurant>());
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(entity);

            Assert.NotNull(result);
            _repositoryMock.Verify(r => r.Add(It.IsAny<CategoryRestaurant>()), Times.Once);
        }

        [Fact(DisplayName = "Create duplicate notifies error")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task Create_Duplicate_NotifiesError()
        {
            var entity = CreateValid();
            _repositoryMock.Setup(r => r.Search(It.IsAny<Expression<Func<CategoryRestaurant, bool>>>(), null, null, null))
                .ReturnsAsync(new List<CategoryRestaurant> { entity });

            var result = await _service.Create(entity);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing succeeds")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task Update_Existing_Succeeds()
        {
            var entity = CreateValid();
            var existing = CreateValid();
            existing.Id = entity.Id;

            _repositoryMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(existing);
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(entity);

            Assert.NotNull(result);
            _repositoryMock.Verify(r => r.Update(It.IsAny<CategoryRestaurant>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing succeeds")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task Delete_Existing_Succeeds()
        {
            var entity = CreateValid();
            _repositoryMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(entity);
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(entity.Id);

            Assert.NotNull(result);
            _repositoryMock.Verify(r => r.Remove(entity.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing notifies error")]
        [Trait("CategoryRestaurantServiceTest", "CategoryRestaurant Service Tests")]
        public async Task Delete_NonExisting_NotifiesError()
        {
            _repositoryMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((CategoryRestaurant)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
