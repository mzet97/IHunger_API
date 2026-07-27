using IHunger.Domain.Models;
using System;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IUserService
    {
        Task<User> GetById(Guid id);
        Task<User> GetByEmail(string email);
        Task<User> Update(User user);
        Task<bool> Delete(Guid id);
    }
}
