using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Domain.Models.Validations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class CouponService : BaseService, ICouponService
    {
        private readonly ICouponRepository _couponRepository;

        public CouponService(
            ICouponRepository couponRepository,
            INotifier notifier) : base(notifier)
        {
            _couponRepository = couponRepository;
        }

        public async Task<Coupon> Create(Coupon coupon)
        {
            if (!Validate(new CouponValidation(), coupon)) return null;

            var coupons = await _couponRepository
                .Search(x => x.Code == coupon.Code && x.ExpireAt < DateTime.Now);

            if (coupons != null && coupons.Any())
            {
                NotifyError("Already exists coupon the same code and atived");
                return await Task.FromResult<Coupon>(null);
            }

            await _couponRepository
                .Add(coupon);

            if (await _couponRepository.Commit())
            {
                return await Task.FromResult(coupon);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<Coupon>(null);
        }

        public async Task<List<Coupon>> GetAll(bool ative = true)
        {
            if (ative)
            {
                return (List<Coupon>) await _couponRepository
                .Find(x => x.ExpireAt > DateTime.Now);
            }

            return await _couponRepository
                 .GetAll();
        }

        public async Task<Coupon> GetById(Guid id)
        {
            return await _couponRepository
                 .GetById(id);
        }

        public async Task<Coupon> Update(Coupon coupon)
        {
            if (!Validate(new CouponValidation(), coupon)) return null;

            var couponDb = await _couponRepository
                .GetById(coupon.Id);

            if (couponDb == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Coupon>(null);
            }

            if (couponDb.Code != couponDb.Code)
            {
                couponDb.Code = couponDb.Code;
            }

            if (couponDb.ExpireAt != couponDb.ExpireAt)
            {
                couponDb.ExpireAt = couponDb.ExpireAt;
            }
            
            if (couponDb.Value != couponDb.Value)
            {
                couponDb.Value = couponDb.Value;
            }

            _couponRepository
                 .Update(couponDb);

            if (await _couponRepository.Commit())
            {
                return await Task.FromResult<Coupon>(couponDb);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Coupon>(null);
        }

        public async Task<Coupon> Delete(Guid id)
        {
            var coupon = await _couponRepository
                .GetById(id);

            if (coupon == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Coupon>(null);
            }

            _couponRepository
                .Remove(id);

            if (await _couponRepository.Commit())
            {
                return await Task.FromResult(coupon);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Coupon>(null);
        }
    }
}
