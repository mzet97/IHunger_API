using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using Moq;
using Xunit;

namespace IHunger.Service.Test
{
    public class CouponServiceTest
    {
        private readonly Mock<ICouponRepository> _couponRepositoryMock;
        private readonly Mock<INotifier> _notifierMock;
        private readonly CouponService _couponService;

        public CouponServiceTest()
        {
            _couponRepositoryMock = new Mock<ICouponRepository>();
            _notifierMock = new Mock<INotifier>();
            _couponService = new CouponService(_couponRepositoryMock.Object, _notifierMock.Object);
        }

        private Coupon CreateValidCoupon()
        {
            return new Coupon
            {
                Id = Guid.NewGuid(),
                Code = "TEST10",
                ExpireAt = DateTime.Now.AddDays(30),
                Value = 10,
                CreatedAt = DateTime.Now
            };
        }

        [Fact(DisplayName = "GetById returns coupon")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task GetById_ReturnsCoupon()
        {
            var coupon = CreateValidCoupon();
            _couponRepositoryMock.Setup(r => r.GetById(coupon.Id)).ReturnsAsync(coupon);

            var result = await _couponService.GetById(coupon.Id);

            Assert.NotNull(result);
            Assert.Equal(coupon.Id, result.Id);
            Assert.Equal(coupon.Code, result.Code);
        }

        [Fact(DisplayName = "GetAll active returns filtered list")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task GetAll_Active_ReturnsFilteredList()
        {
            var coupons = new List<Coupon> { CreateValidCoupon(), CreateValidCoupon() };
            _couponRepositoryMock.Setup(r => r.Find(It.IsAny<System.Linq.Expressions.Expression<Func<Coupon, bool>>>()))
                .ReturnsAsync(coupons);

            var result = await _couponService.GetAll(true);

            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }

        [Fact(DisplayName = "GetAll inactive returns all")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task GetAll_Inactive_ReturnsAll()
        {
            var coupons = new List<Coupon> { CreateValidCoupon() };
            _couponRepositoryMock.Setup(r => r.GetAll()).ReturnsAsync(coupons);

            var result = await _couponService.GetAll(false);

            Assert.NotNull(result);
            Assert.Single(result);
        }

        [Fact(DisplayName = "Create valid coupon succeeds")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Create_ValidCoupon_Succeeds()
        {
            var coupon = CreateValidCoupon();
            _couponRepositoryMock.Setup(r => r.Search(It.IsAny<System.Linq.Expressions.Expression<Func<Coupon, bool>>>(), null, null, null))
                .ReturnsAsync(new List<Coupon>());
            _couponRepositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _couponService.Create(coupon);

            Assert.NotNull(result);
            Assert.Equal(coupon.Code, result.Code);
            _couponRepositoryMock.Verify(r => r.Add(It.IsAny<Coupon>()), Times.Once);
        }

        [Fact(DisplayName = "Create duplicate coupon notifies error")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Create_DuplicateCoupon_NotifiesError()
        {
            var coupon = CreateValidCoupon();
            _couponRepositoryMock.Setup(r => r.Search(It.IsAny<System.Linq.Expressions.Expression<Func<Coupon, bool>>>(), null, null, null))
                .ReturnsAsync(new List<Coupon> { coupon });

            var result = await _couponService.Create(coupon);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Update existing coupon succeeds")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Update_ExistingCoupon_Succeeds()
        {
            var coupon = CreateValidCoupon();
            var existingCoupon = CreateValidCoupon();
            existingCoupon.Id = coupon.Id;

            _couponRepositoryMock.Setup(r => r.GetById(coupon.Id)).ReturnsAsync(existingCoupon);
            _couponRepositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _couponService.Update(coupon);

            Assert.NotNull(result);
            Assert.Equal(coupon.Code, result.Code);
            _couponRepositoryMock.Verify(r => r.Update(It.IsAny<Coupon>()), Times.Once);
        }

        [Fact(DisplayName = "Update non-existing coupon notifies error")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Update_NonExistingCoupon_NotifiesError()
        {
            var coupon = CreateValidCoupon();
            _couponRepositoryMock.Setup(r => r.GetById(coupon.Id)).ReturnsAsync((Coupon)null);

            var result = await _couponService.Update(coupon);

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }

        [Fact(DisplayName = "Delete existing coupon succeeds")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Delete_ExistingCoupon_Succeeds()
        {
            var coupon = CreateValidCoupon();
            _couponRepositoryMock.Setup(r => r.GetById(coupon.Id)).ReturnsAsync(coupon);
            _couponRepositoryMock.Setup(r => r.Commit()).ReturnsAsync(true);

            var result = await _couponService.Delete(coupon.Id);

            Assert.NotNull(result);
            _couponRepositoryMock.Verify(r => r.Remove(coupon.Id), Times.Once);
        }

        [Fact(DisplayName = "Delete non-existing coupon notifies error")]
        [Trait("CouponServiceTest", "Coupon Service Tests")]
        public async Task Delete_NonExistingCoupon_NotifiesError()
        {
            _couponRepositoryMock.Setup(r => r.GetById(It.IsAny<Guid>())).ReturnsAsync((Coupon)null);

            var result = await _couponService.Delete(Guid.NewGuid());

            Assert.Null(result);
            _notifierMock.Verify(n => n.Handle(It.IsAny<Domain.Notifications.Notification>()), Times.Once);
        }
    }
}
