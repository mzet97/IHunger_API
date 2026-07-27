using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using Xunit;

namespace IHunger.Service.Test
{
    public class AddressUserServiceTest
    {
        private readonly Mock<IAddressUserRepository> _repoMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly AddressUserService _service;

        public AddressUserServiceTest()
        {
            _repoMock = new Mock<IAddressUserRepository>();
            _notifierMock = new Mock<INotifier>();
            _service = new AddressUserService(_repoMock.Object, _notifierMock.Object);
        }

        private AddressUser CreateValid()
        {
            return new AddressUser
            {
                Id = Guid.NewGuid(),
                Street = Faker.Address.StreetAddress(),
                District = Faker.Address.City(),
                City = Faker.Address.City(),
                County = Faker.Address.Country(),
                ZipCode = Faker.Address.ZipCode(),
                Latitude = "0",
                Longitude = "0",
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns address")]
        [Trait("AddressUserServiceTest", "AddressUser Service Tests")]
        public async Task GetById_ReturnsAddress()
        {
            var entity = CreateValid();
            _repoMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(entity);

            var result = await _service.GetById(entity.Id);

            Assert.NotNull(result);
            Assert.Equal(entity.Street, result.Street);
        }

        [Fact(DisplayName = "Create succeeds")]
        [Trait("AddressUserServiceTest", "AddressUser Service Tests")]
        public async Task Create_Succeeds()
        {
            var entity = CreateValid();
            _repoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Create(entity);

            Assert.NotNull(result);
            _repoMock.Verify(r => r.Add(It.IsAny<AddressUser>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing succeeds")]
        [Trait("AddressUserServiceTest", "AddressUser Service Tests")]
        public async Task Update_Existing_Succeeds()
        {
            var entity = CreateValid();
            var existing = CreateValid();
            existing.Id = entity.Id;

            _repoMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(existing);
            _repoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Update(entity);

            Assert.NotNull(result);
            Assert.Equal(entity.Street, result.Street);
        }

        [Fact(DisplayName = "Delete existing succeeds")]
        [Trait("AddressUserServiceTest", "AddressUser Service Tests")]
        public async Task Delete_Existing_Succeeds()
        {
            var entity = CreateValid();
            _repoMock.Setup(r => r.GetById(entity.Id)).ReturnsAsync(entity);
            _repoMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _service.Delete(entity.Id);

            Assert.NotNull(result);
            _repoMock.Verify(r => r.Remove(entity.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing notifies error")]
        [Trait("AddressUserServiceTest", "AddressUser Service Tests")]
        public async Task Delete_NonExisting_NotifiesError()
        {
            _repoMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((AddressUser)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
