using AutoMapper;
using IHunger.Infra.Data.Context;
using IHunger.WebAPI;
using IHunger.WebAPI.ViewModels.Address;
using IHunger.WebAPI.ViewModels.Profile;
using IHunger.WebAPI.ViewModels.User;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Integration.Test
{
    public abstract class BaseIntegration : IDisposable
    {
        public DataIdentityDbContext dbContext { get; private set; }
        public HttpClient client { get; private set; }
        public IMapper mapper { get; set; }
        public string hostApi { get; set; }
        public HttpResponseMessage response { get; set; }

        public BaseIntegration()
        {
            hostApi = "https://localhost:44372/api/v1/";

            var builder = new WebHostBuilder()
               .UseEnvironment("Testing")
               .UseStartup<Startup>();

            var server = new TestServer(builder);

            dbContext = server.Host.Services.GetService(typeof(DataIdentityDbContext)) as DataIdentityDbContext;
            dbContext?.Database.Migrate();

            client = server.CreateClient();
        }

        public async Task<string> GetTokenAdmin()
        {
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

            var responseLogin = await client.PostAsync($"{hostApi}auth/login",
                new StringContent(JsonConvert.SerializeObject(loginUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonLogin = await responseLogin.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(jsonLogin.ToString());
            IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel userData = JsonConvert.DeserializeObject<IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel>(data.data.ToString());

            return userData.AccessToken;
        }

        public async Task<string> GetTokenClient()
        {
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
            registerUserViewModel.Profile.Type = 2;

            var responseRegister = await client.PostAsync($"{hostApi}auth/register",
                new StringContent(JsonConvert.SerializeObject(registerUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonRegister = await responseRegister.Content.ReadAsStringAsync();

            var loginUserViewModel = new LoginUserViewModel();
            loginUserViewModel.Email = registerUserViewModel.Email;
            loginUserViewModel.Password = "Admin@123";

            var responseLogin = await client.PostAsync($"{hostApi}auth/login",
                new StringContent(JsonConvert.SerializeObject(loginUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonLogin = await responseLogin.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(jsonLogin.ToString());
            IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel userData = JsonConvert.DeserializeObject<IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel>(data.data.ToString());

            return userData.AccessToken;
        }

        public async Task<string> GetTokenRestaurant()
        {
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
            registerUserViewModel.Profile.Type = 3;

            var responseRegister = await client.PostAsync($"{hostApi}auth/register",
                new StringContent(JsonConvert.SerializeObject(registerUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonRegister = await responseRegister.Content.ReadAsStringAsync();

            var loginUserViewModel = new LoginUserViewModel();
            loginUserViewModel.Email = registerUserViewModel.Email;
            loginUserViewModel.Password = "Admin@123";

            var responseLogin = await client.PostAsync($"{hostApi}auth/login",
                new StringContent(JsonConvert.SerializeObject(loginUserViewModel), System.Text.Encoding.UTF8, "application/json"));
            string jsonLogin = await responseLogin.Content.ReadAsStringAsync();
            dynamic data = JObject.Parse(jsonLogin.ToString());
            IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel userData = JsonConvert.DeserializeObject<IHunger.Infra.CrossCutting.ViewModels.User.LoginResponseViewModel>(data.data.ToString());

            return userData.AccessToken;
        }

        public void Dispose()
        {
            dbContext.Dispose();
            client.Dispose();
        }
    }
}
