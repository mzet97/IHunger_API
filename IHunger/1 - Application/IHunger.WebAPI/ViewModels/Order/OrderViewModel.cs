using IHunger.WebAPI.ViewModels.Coupon;
using IHunger.WebAPI.ViewModels.Item;
using System;
using System.Collections.Generic;

namespace IHunger.WebAPI.ViewModels.Order
{
    public class OrderViewModel : BaseViewModel
    {
        public Guid? IdCoupon { get; set; }
        public CouponViewModel Coupon { get; set; }
        public Guid? IdProfileUser { get; set; }
        public virtual IEnumerable<ItemViewModel> Items { get; set; }
    }
}
