using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class UserService : BaseService, IUserService
    {
        private readonly IProfileUserRepository _profileUserRepository;
        private readonly UserManager<User> _userManager;

        public UserService(
            IProfileUserRepository profileUserRepository,
            UserManager<User> userManager,
            INotifier notifier) : base(notifier)
        {
            _profileUserRepository = profileUserRepository;
            _userManager = userManager;
        }

        public async Task<User> GetById(Guid id)
        {
            var user = await _userManager.FindByIdAsync(id.ToString());

            if (user == null)
            {
                NotifyError("User not found");
                return null;
            }

            return user;
        }

        public async Task<User> GetByEmail(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);

            if (user == null)
            {
                NotifyError("User not found");
                return null;
            }

            return user;
        }

        public async Task<User> Update(User user)
        {
            var userDb = await _userManager.FindByIdAsync(user.Id.ToString());

            if (userDb == null)
            {
                NotifyError("User not found");
                return null;
            }

            userDb.UserName = user.UserName;
            userDb.Email = user.Email;
            userDb.PhoneNumber = user.PhoneNumber;

            var result = await _userManager.UpdateAsync(userDb);

            if (result.Succeeded)
            {
                return userDb;
            }

            foreach (var error in result.Errors)
            {
                NotifyError(error.Description);
            }

            return null;
        }

        public async Task<bool> Delete(Guid id)
        {
            var user = await _userManager.FindByIdAsync(id.ToString());

            if (user == null)
            {
                NotifyError("User not found");
                return false;
            }

            var result = await _userManager.DeleteAsync(user);

            if (result.Succeeded)
            {
                return true;
            }

            foreach (var error in result.Errors)
            {
                NotifyError(error.Description);
            }

            return false;
        }
    }
}
