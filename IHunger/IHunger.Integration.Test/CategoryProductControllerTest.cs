using IHunger.WebAPI.ViewModels.CategoryProduct;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Xunit;

namespace IHunger.Integration.Test
{
    public class CategoryProductControllerTest : BaseIntegration
    {

        [Fact(DisplayName = "CategoryProduct with success")]
        [Trait("CategoryProductControllerTest", "CategoryProduct Controller Tests")]
        public async Task RegisterWithSuccess()
        {
            // Arrange
            var tokenAdmin = await this.GetTokenAdmin();
            var viewModel = new CategoryProductCreatedViewModel();
            viewModel.Description = Faker.Name.First();
            viewModel.Name = Faker.Lorem.Sentence();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer",
                                                         tokenAdmin);

            // Act
            var response = await client.PostAsync($"{hostApi}category-products",
                new StringContent(JsonConvert.SerializeObject(viewModel), System.Text.Encoding.UTF8, "application/json"));
            string json = await response.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(json.ToString());
            CategoryProductViewModel category = JsonConvert.DeserializeObject<CategoryProductViewModel>(data.data.ToString());

            // Assert
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
            Assert.NotNull(category);
            Assert.Equal(viewModel.Name, category.Name);
            Assert.Equal(viewModel.Description, category.Description);
            
        }
    }
}
