using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Xunit;

namespace IHunger.Service.Test
{
    public class CategoryProductServiceTest
    {
        private readonly Mock<ICategoryProductRepository> _repositoryMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly CategoryProductService _service;

        public CategoryProductServiceTest()
        {
            _repositoryMock = new Mock<ICategoryProductRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new CategoryProductService(_notifierMock.Object, _repositoryMock.Object);
        }

        private CategoryProduct CreateValidCategory()
        {
            return new CategoryProduct
            {
                Id = Guid.NewGuid(),
                Name = Faker.Name.First(),
                Description = Faker.Lorem.Sentence(),
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns category")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task GetById_ReturnsCategory()
        {
            var category = CreateValidCategory();
            _repositoryMock.Setup(r => r.GetById(category.Id)).ReturnsAsync(category);

            var result = await _service.GetById(category.Id);

            Assert.NotNull(result);
            Assert.Equal(category.Id, result.Id);
            Assert.Equal(category.Name, result.Name);
        }

        [Fact(DisplayName = "GetById returns null when not found")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task GetById_ReturnsNull_WhenNotFound()
        {
            _repositoryMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((CategoryProduct)null);

            var result = await _service.GetById(Guid.NewGuid());

            Assert.Null(result);
        }

        [Fact(DisplayName = "GetAll returns list")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task GetAll_ReturnsList()
        {
            var categories = new List<CategoryProduct> { CreateValidCategory(), CreateValidCategory() };
            _repositoryMock.Setup(r => r.GetAll()).ReturnsAsync(categories);

            var result = await _service.GetAll();

            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }

        [Fact(DisplayName = "Create valid category succeeds")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Create_ValidCategory_Succeeds()
        {
            var category = CreateValidCategory();
            _repositoryMock.Setup(r => r.Search(It.IsAny<Expression<Func<CategoryProduct, bool>>>(), null, null, null))
                .ReturnsAsync(new List<CategoryProduct>());
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(category);

            Assert.NotNull(result);
            Assert.Equal(category.Name, result.Name);
            _repositoryMock.Verify(r => r.Add(It.IsAny<CategoryProduct>()), Times.Once);
        }

        [Fact(DisplayName = "Create duplicate category notifies error")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Create_DuplicateCategory_NotifiesError()
        {
            var category = CreateValidCategory();
            _repositoryMock.Setup(r => r.Search(It.IsAny<Expression<Func<CategoryProduct, bool>>>(), null, null, null))
                .ReturnsAsync(new List<CategoryProduct> { category });

            var result = await _service.Create(category);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing category succeeds")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Update_ExistingCategory_Succeeds()
        {
            var category = CreateValidCategory();
            var existing = CreateValidCategory();
            existing.Id = category.Id;

            _repositoryMock.Setup(r => r.GetById(category.Id)).ReturnsAsync(existing);
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(category);

            Assert.NotNull(result);
            _repositoryMock.Verify(r => r.Update(It.IsAny<CategoryProduct>()), Times.Once);
        }

        [Fact(DisplayName = "Update non-existing category notifies error")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Update_NonExistingCategory_NotifiesError()
        {
            var category = CreateValidCategory();
            _repositoryMock.Setup(r => r.GetById(category.Id)).ReturnsAsync((CategoryProduct)null);

            var result = await _service.Update(category);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing category succeeds")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Delete_ExistingCategory_Succeeds()
        {
            var category = CreateValidCategory();
            _repositoryMock.Setup(r => r.GetById(category.Id)).ReturnsAsync(category);
            _repositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(category.Id);

            Assert.NotNull(result);
            _repositoryMock.Verify(r => r.Remove(category.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing category notifies error")]
        [Trait("CategoryProductServiceTest", "CategoryProduct Service Tests")]
        public async Task Delete_NonExistingCategory_NotifiesError()
        {
            _repositoryMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((CategoryProduct)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
