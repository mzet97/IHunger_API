using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace IHunger.Service.Test
{
    public class CategoryProductServiceTest
    {
        private ICategoryProductService _categoryProductService;
        private Mock<ICategoryProductService> _serviceMock;
        private List<CategoryProduct> _categories;

        public CategoryProductServiceTest()
        {
            _categories = new List<CategoryProduct>();
        }


        [Fact(DisplayName = "Test Get success")]
        [Trait("CategoryProductServiceTest", "CategoryProductService Service Tests")]
        public  async Task Get()
        {
            var category = new CategoryProduct();
            category.Id = Guid.NewGuid();
            category.Name = Faker.Name.First();
            category.Description = Faker.Lorem.Sentence();
            category.CreatedAt = DateTime.Now;
            category.UpdatedAt = DateTime.Now;

            _serviceMock = new Mock<ICategoryProductService>();
            _serviceMock.Setup(m => m.GetById(category.Id)).ReturnsAsync(category);
            _categoryProductService = _serviceMock.Object;

            var result = await _categoryProductService.GetById(category.Id);
            Assert.NotNull(result);
            Assert.True(result.Id == category.Id);
            Assert.Equal(category.Name, result.Name);

            _serviceMock = new Mock<ICategoryProductService>();
            _serviceMock.Setup(m => m.GetById(It.IsAny<Guid>())).Returns(Task.FromResult((CategoryProduct)null));
            _categoryProductService = _serviceMock.Object;

            var resultNull = await _categoryProductService.GetById(category.Id);
            Assert.Null(resultNull);
        }
    }
}
