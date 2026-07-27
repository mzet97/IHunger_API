using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using System;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class AddressRestaurantService : BaseService, IAddressRestaurantService
    {
        private readonly IAddressRestaurantRepository _addressRestaurantRepository;

        public AddressRestaurantService(
            IAddressRestaurantRepository addressRestaurantRepository,
            INotifier notifier) : base(notifier)
        {
            _addressRestaurantRepository = addressRestaurantRepository;
        }

        public async Task<AddressRestaurant> GetById(Guid id)
        {
            return await _addressRestaurantRepository.GetById(id);
        }

        public async Task<AddressRestaurant> Create(AddressRestaurant address)
        {
            address.CreatedAt = DateTime.Now;

            await _addressRestaurantRepository.Add(address);

            if (await _addressRestaurantRepository.Commit())
            {
                return address;
            }

            NotifyError("Error inserting entity");
            return null;
        }

        public async Task<AddressRestaurant> Update(AddressRestaurant address)
        {
            var addressDb = await _addressRestaurantRepository.GetById(address.Id);

            if (addressDb == null)
            {
                NotifyError("Address not found");
                return null;
            }

            addressDb.Street = address.Street;
            addressDb.District = address.District;
            addressDb.City = address.City;
            addressDb.County = address.County;
            addressDb.ZipCode = address.ZipCode;
            addressDb.Latitude = address.Latitude;
            addressDb.Longitude = address.Longitude;

            _addressRestaurantRepository.Update(addressDb);

            if (await _addressRestaurantRepository.Commit())
            {
                return addressDb;
            }

            NotifyError("Error updating entity");
            return null;
        }

        public async Task<AddressRestaurant> Delete(Guid id)
        {
            var address = await _addressRestaurantRepository.GetById(id);

            if (address == null)
            {
                NotifyError("Address not found");
                return null;
            }

            _addressRestaurantRepository.Remove(id);

            if (await _addressRestaurantRepository.Commit())
            {
                return address;
            }

            NotifyError("Error deleting entity");
            return null;
        }
    }
}
