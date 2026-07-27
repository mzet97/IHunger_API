using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Microsoft.AspNetCore.Identity;
using Moq;
using Xunit;

namespace IHunger.Service.Test
{
    public class UserServiceTest
    {
        private readonly Mock<IProfileUserRepository> _profileRepoMock;
        private readonly Mock<UserManager<User>> _userManagerMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly UserService _service;

        public UserServiceTest()
        {
            _profileRepoMock = new Mock<IProfileUserRepository>();
            _notifierMock = new Mock<INotifier>();

            var store = new Mock<IUserStore<User>>();
            _userManagerMock = new Mock<UserManager<User>>(store.Object, null, null, null, null, null, null, null, null);

            _service = new UserService(_profileRepoMock.Object, _userManagerMock.Object, _notifierMock.Object);
        }

        private User CreateValidUser()
        {
            return new User
            {
                Id = Guid.NewGuid(),
                UserName = "test@example.com",
                Email = "test@example.com",
                PhoneNumber = "1234567890"
            };
        }

        [Fact(DisplayName = "GetById returns user")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task GetById_ReturnsUser()
        {
            var user = CreateValidUser();
            _userManagerMock.Setup(m => m.FindByIdAsync(user.Id.ToString())).ReturnsAsync(user);

            var result = await _service.GetById(user.Id);

            Assert.NotNull(result);
            Assert.Equal(user.Id, result.Id);
        }

        [Fact(DisplayName = "GetById returns null when not found")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task GetById_ReturnsNull_WhenNotFound()
        {
            _userManagerMock.Setup(m => m.FindByIdAsync(It.IsAny<string>())).ReturnsAsync((User)null);

            var result = await _service.GetById(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "GetByEmail returns user")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task GetByEmail_ReturnsUser()
        {
            var user = CreateValidUser();
            _userManagerMock.Setup(m => m.FindByEmailAsync(user.Email)).ReturnsAsync(user);

            var result = await _service.GetByEmail(user.Email);

            Assert.NotNull(result);
            Assert.Equal(user.Email, result.Email);
        }

        [Fact(DisplayName = "GetByEmail returns null when not found")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task GetByEmail_ReturnsNull_WhenNotFound()
        {
            _userManagerMock.Setup(m => m.FindByEmailAsync(It.IsAny<string>())).ReturnsAsync((User)null);

            var result = await _service.GetByEmail("nonexistent@email.com");

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing user succeeds")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task Update_ExistingUser_Succeeds()
        {
            var user = CreateValidUser();
            var existing = CreateValidUser();
            existing.Id = user.Id;

            _userManagerMock.Setup(m => m.FindByIdAsync(user.Id.ToString())).ReturnsAsync(existing);
            _userManagerMock.Setup(m => m.UpdateAsync(It.IsAny<User>())).ReturnsAsync(IdentityResult.Success);

            var result = await _service.Update(user);

            Assert.NotNull(result);
            _userManagerMock.Verify(m => m.UpdateAsync(It.IsAny<User>()), Times.Once);
        }

        [Fact(DisplayName = "Update non-existing user notifies error")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task Update_NonExistingUser_NotifiesError()
        {
            var user = CreateValidUser();
            _userManagerMock.Setup(m => m.FindByIdAsync(user.Id.ToString())).ReturnsAsync((User)null);

            var result = await _service.Update(user);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update failed result notifies errors")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task Update_FailedResult_NotifiesErrors()
        {
            var user = CreateValidUser();
            var existing = CreateValidUser();
            existing.Id = user.Id;

            _userManagerMock.Setup(m => m.FindByIdAsync(user.Id.ToString())).ReturnsAsync(existing);
            _userManagerMock.Setup(m => m.UpdateAsync(It.IsAny<User>()))
                .ReturnsAsync(IdentityResult.Failed(new IdentityError { Description = "Update failed" }));

            var result = await _service.Update(user);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing user succeeds")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task Delete_ExistingUser_Succeeds()
        {
            var user = CreateValidUser();
            _userManagerMock.Setup(m => m.FindByIdAsync(user.Id.ToString())).ReturnsAsync(user);
            _userManagerMock.Setup(m => m.DeleteAsync(user)).ReturnsAsync(IdentityResult.Success);

            var result = await _service.Delete(user.Id);

            Assert.True(result);
            _userManagerMock.Verify(m => m.DeleteAsync(user), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing user notifies error")]
        [Trait("UserServiceTest", "User Service Tests")]
        public async Task Delete_NonExistingUser_NotifiesError()
        {
            _userManagerMock.Setup(m => m.FindByIdAsync(It.IsAny<string>())).ReturnsAsync((User)null);

            var result = await _service.Delete(Guid.NewGuid());

            Assert.False(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
