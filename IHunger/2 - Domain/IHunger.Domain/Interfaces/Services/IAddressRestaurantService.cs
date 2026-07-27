using IHunger.Domain.Models;
using System;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IAddressRestaurantService
    {
        Task<AddressRestaurant> GetById(Guid id);
        Task<AddressRestaurant> Create(AddressRestaurant address);
        Task<AddressRestaurant> Update(AddressRestaurant address);
        Task<AddressRestaurant> Delete(Guid id);
    }
}
