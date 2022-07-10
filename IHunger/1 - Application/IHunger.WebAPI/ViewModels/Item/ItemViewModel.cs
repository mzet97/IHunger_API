using IHunger.WebAPI.ViewModels.Product;
using System;

namespace IHunger.WebAPI.ViewModels.Item
{
    public class ItemViewModel : BaseViewModel
    {
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public Guid IdProduct { get; set; }
        public ProductViewModel Product { get; set; }
    }
}
