using IHunger.Domain.Models;
using System;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IAddressUserService
    {
        Task<AddressUser> GetById(Guid id);
        Task<AddressUser> Create(AddressUser address);
        Task<AddressUser> Update(AddressUser address);
        Task<AddressUser> Delete(Guid id);
    }
}
