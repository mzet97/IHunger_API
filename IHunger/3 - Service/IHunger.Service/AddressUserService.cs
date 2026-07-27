using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using System;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class AddressUserService : BaseService, IAddressUserService
    {
        private readonly IAddressUserRepository _addressUserRepository;

        public AddressUserService(
            IAddressUserRepository addressUserRepository,
            INotifier notifier) : base(notifier)
        {
            _addressUserRepository = addressUserRepository;
        }

        public async Task<AddressUser> GetById(Guid id)
        {
            return await _addressUserRepository.GetById(id);
        }

        public async Task<AddressUser> Create(AddressUser address)
        {
            address.CreatedAt = DateTime.Now;

            await _addressUserRepository.Add(address);

            if (await _addressUserRepository.Commit())
            {
                return address;
            }

            NotifyError("Error inserting entity");
            return null;
        }

        public async Task<AddressUser> Update(AddressUser address)
        {
            var addressDb = await _addressUserRepository.GetById(address.Id);

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

            _addressUserRepository.Update(addressDb);

            if (await _addressUserRepository.Commit())
            {
                return addressDb;
            }

            NotifyError("Error updating entity");
            return null;
        }

        public async Task<AddressUser> Delete(Guid id)
        {
            var address = await _addressUserRepository.GetById(id);

            if (address == null)
            {
                NotifyError("Address not found");
                return null;
            }

            _addressUserRepository.Remove(id);

            if (await _addressUserRepository.Commit())
            {
                return address;
            }

            NotifyError("Error deleting entity");
            return null;
        }
    }
}
