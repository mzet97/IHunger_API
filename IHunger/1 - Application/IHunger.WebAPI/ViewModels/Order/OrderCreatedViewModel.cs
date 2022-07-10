using System;

namespace IHunger.WebAPI.ViewModels.Order
{
    public class OrderCreatedViewModel : BaseViewModel
    {
        public decimal Price { get; set; }
        public string OrderStatus { get; set; }
        public Guid? IdCoupon { get; set; }
       
    }
}
