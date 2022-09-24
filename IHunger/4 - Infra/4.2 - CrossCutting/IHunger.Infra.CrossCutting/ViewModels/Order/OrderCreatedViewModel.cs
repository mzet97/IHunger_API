using IHunger.Infra.CrossCutting.ViewModels.Item;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Infra.CrossCutting.ViewModels.Order
{
    public class OrderCreatedViewModel
    {
        public string OrderStatus { get; set; }
        public Guid? IdCoupon { get; set; }
        public Guid? IdProfileUser { get; set; }
        public virtual IEnumerable<ItemCreatedViewModel> Items { get; set; }
    }
}
