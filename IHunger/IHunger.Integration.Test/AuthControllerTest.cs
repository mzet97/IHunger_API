using IHunger.WebAPI.ViewModels.Address;
using IHunger.WebAPI.ViewModels.Profile;
using IHunger.WebAPI.ViewModels.Response;
using IHunger.WebAPI.ViewModels.User;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace IHunger.Integration.Test
{
    public class AuthControllerTest : BaseIntegration
    {

        [Fact(DisplayName = "Register user with success")]
        [Trait("AuthControllerTest", "Auth Controller Tests")]
        public async Task RegisterWithSuccess()
        {
            // Arrange
            var viewModel = new RegisterUserViewModel();
            viewModel.Email = Faker.Internet.Email();
            viewModel.Password = "Admin@123";
            viewModel.ConfirmPassword = "Admin@123";

            viewModel.Address = new AddressUserCreatedViewModel();
            viewModel.Address.Street = Faker.Address.StreetAddress();
            viewModel.Address.City = Faker.Address.City();
            viewModel.Address.District = Faker.Address.City();
            viewModel.Address.County = Faker.Address.Country();
            viewModel.Address.ZipCode = Faker.Address.ZipCode();
            viewModel.Address.Latitude = Faker.RandomNumber.Next(100000).ToString();
            viewModel.Address.Longitude = Faker.RandomNumber.Next(100000).ToString();

            viewModel.Profile = new ProfileCreatedViewModel();
            viewModel.Profile.Name = Faker.Name.First();
            viewModel.Profile.LastName = Faker.Name.Last();
            viewModel.Profile.BirthDate = Faker.DateOfBirth.Next();
            viewModel.Profile.Type = 1;

            // Act
            var response = await client.PostAsync($"{hostApi}auth/register",
                new StringContent(JsonConvert.SerializeObject(viewModel), System.Text.Encoding.UTF8, "application/json"));
            string json = await response.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(json.ToString());
            LoginResponseViewModel userData = JsonConvert.DeserializeObject<LoginResponseViewModel>(data.data.ToString());

            // Assert
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
            Assert.NotNull(userData);
            Assert.NotNull(userData?.UserToken);
            Assert.Equal(viewModel.Email, userData?.UserToken.Email);
            Assert.True(userData?.ExpiresIn > 0);
            Assert.True(userData?.AccessToken.Length > 0);
            Assert.True(userData?.UserToken.Id.Length > 0);
            Assert.True(userData?.UserToken.Claims.ToList().Count() > 0);
        }

        [Fact(DisplayName = "Register user with error")]
        [Trait("AuthControllerTest", "Auth Controller Tests")]
        public async Task RegisterWithError()
        {
            // Arrange
            var viewModel = new RegisterUserViewModel();
            viewModel.Email = Faker.Internet.Email();
            viewModel.Password = "Admin@123";
            viewModel.ConfirmPassword = "Admin@1234";

            viewModel.Address = new AddressUserCreatedViewModel();
            viewModel.Address.Street = Faker.Address.StreetAddress();
            viewModel.Address.City = Faker.Address.City();
            viewModel.Address.District = Faker.Address.City();
            viewModel.Address.County = Faker.Address.Country();
            viewModel.Address.ZipCode = Faker.Address.ZipCode();
            viewModel.Address.Latitude = Faker.RandomNumber.Next(100000).ToString();
            viewModel.Address.Longitude = Faker.RandomNumber.Next(100000).ToString();

            viewModel.Profile = new ProfileCreatedViewModel();
            viewModel.Profile.Name = Faker.Name.First();
            viewModel.Profile.LastName = Faker.Name.Last();
            viewModel.Profile.BirthDate = Faker.DateOfBirth.Next();
            viewModel.Profile.Type = 1;

            // Act
            var response = await client.PostAsync($"{hostApi}auth/register",
                new StringContent(JsonConvert.SerializeObject(viewModel), System.Text.Encoding.UTF8, "application/json"));
            string json = await response.Content.ReadAsStringAsync();
            ResponseErrorViewModel data = JsonConvert.DeserializeObject<ResponseErrorViewModel>(json.ToString());

            // Assert
            Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
            Assert.NotNull(data);
            Assert.False(data.success);
            Assert.True(data.errors.ToList().Count > 0);
        }

        [Fact(DisplayName = "Login user with error")]
        [Trait("AuthControllerTest", "Auth Controller Tests")]
        public async Task LoginWithError()
        {
            // Arrange
            var viewModel = new LoginUserViewModel();
            viewModel.Email = Faker.Internet.Email();
            viewModel.Password = "Admin@123";

            // Act
            var response = await client.PostAsync($"{hostApi}auth/login",
                new StringContent(JsonConvert.SerializeObject(viewModel), System.Text.Encoding.UTF8, "application/json"));
            string json = await response.Content.ReadAsStringAsync();
            ResponseErrorViewModel data = JsonConvert.DeserializeObject<ResponseErrorViewModel>(json.ToString());

            // Assert
            Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
            Assert.NotNull(data);
            Assert.False(data.success);
            Assert.True(data.errors.ToList().Count > 0);
        }

        [Fact(DisplayName = "Login user with success")]
        [Trait("AuthControllerTest", "Auth Controller Tests")]
        public async Task LoginWithSuccess()
        {
            // Arrange
            var registerUserViewModel = new RegisterUserViewModel();
            registerUserViewModel.Email = Faker.Internet.Email();
            registerUserViewModel.Password = "Admin@123";
            registerUserViewModel.ConfirmPassword = "Admin@123";

            registerUserViewModel.Address = new AddressUserCreatedViewModel();
            registerUserViewModel.Address.Street = Faker.Address.StreetAddress();
            registerUserViewModel.Address.City = Faker.Address.City();
            registerUserViewModel.Address.District = Faker.Address.City();
            registerUserViewModel.Address.County = Faker.Address.Country();
            registerUserViewModel.Address.ZipCode = Faker.Address.ZipCode();
            registerUserViewModel.Address.Latitude = Faker.RandomNumber.Next(100000).ToString();
            registerUserViewModel.Address.Longitude = Faker.RandomNumber.Next(100000).ToString();

            registerUserViewModel.Profile = new ProfileCreatedViewModel();
            registerUserViewModel.Profile.Name = Faker.Name.First();
            registerUserViewModel.Profile.LastName = Faker.Name.Last();
            registerUserViewModel.Profile.BirthDate = Faker.DateOfBirth.Next();
            registerUserViewModel.Profile.Type = 1;

            var responseRegister = await client.PostAsync($"{hostApi}auth/register",
                new StringContent(JsonConvert.SerializeObject(registerUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonRegister = await responseRegister.Content.ReadAsStringAsync();

            var loginUserViewModel = new LoginUserViewModel();
            loginUserViewModel.Email = registerUserViewModel.Email;
            loginUserViewModel.Password = "Admin@123";

            // Act
            var responseLogin = await client.PostAsync($"{hostApi}auth/login",
                new StringContent(JsonConvert.SerializeObject(loginUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonLogin = await responseLogin.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(jsonLogin.ToString());
            IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel userData = JsonConvert.DeserializeObject<IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel>(data.data.ToString());

            // Assert
            Assert.Equal(HttpStatusCode.OK, responseRegister.StatusCode);
            Assert.Equal(HttpStatusCode.OK, responseLogin.StatusCode);
            Assert.NotNull(userData);
            Assert.NotNull(userData?.UserToken);
            Assert.NotNull(userData?.UserToken?.Profile);
            Assert.NotNull(userData?.UserToken?.Address);
            Assert.Equal(loginUserViewModel.Email, userData?.UserToken.Email);
            Assert.True(userData?.ExpiresIn > 0);
            Assert.True(userData?.AccessToken.Length > 0);
            Assert.True(userData?.UserToken.Id.Length > 0);
            Assert.True(userData?.UserToken.Claims.ToList().Count() > 0);
        }
    }
}
