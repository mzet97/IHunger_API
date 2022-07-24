using IHunger.Domain.Models;
using IHunger.Infra.Data.Context;
using IHunger.Infra.Data.Repository;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace IHunger.Infra.Data.Test
{
    public class CategoryProductRepositoryTest : BaseTest, IClassFixture<BaseTest>
    {
        private ServiceProvider _serviceProvide;

        public CategoryProductRepositoryTest(BaseTest baseTest)
        {
            _serviceProvide = baseTest.ServiceProvider;
        }

        [Fact(DisplayName = "Test CURD success")]
        [Trait("CategoryProductRepositoryTest", "CategoryProductRepository Repository Tests")]
        public async Task TestCategoryProductRepository()
        {
            using (var context = _serviceProvide.GetService<DataIdentityDbContext>())
            {

                var categoryProductRepository = new CategoryProductRepository(context);

                var category = new CategoryProduct();
                category.Id = Guid.NewGuid();
                category.Name = Faker.Name.First();
                category.Description = Faker.Lorem.Sentence();
                category.CreatedAt = DateTime.Now;
                category.UpdatedAt = DateTime.Now;

                await categoryProductRepository.Add(category);

                var isSave = await categoryProductRepository.Commit();
                Assert.True(isSave);

                var categotyDb = await categoryProductRepository.GetById(category.Id);
                Assert.NotNull(categotyDb);
                Assert.Equal(category.Id, categotyDb.Id);

                var categories = await categoryProductRepository.GetAll();
                Assert.NotNull(categories);
                Assert.True(categories.ToList().Count > 0);
                Assert.True(categories.Any(x => x.Id == category.Id));
                var oldDescription = category.Description;
                category.Description = Faker.Lorem.Sentence();

                categoryProductRepository.Update(category);

                var isUpdate = await categoryProductRepository.Commit();
                Assert.True(isUpdate);

                categotyDb = await categoryProductRepository.GetById(category.Id);
                Assert.NotEqual(oldDescription, categotyDb.Description);

                categoryProductRepository.Remove(category.Id);
                var isDelete = await categoryProductRepository.Commit();
                Assert.True(isDelete);

                categotyDb = await categoryProductRepository.GetById(category.Id);
                Assert.Null(categotyDb);


            }
        }
    }
}
