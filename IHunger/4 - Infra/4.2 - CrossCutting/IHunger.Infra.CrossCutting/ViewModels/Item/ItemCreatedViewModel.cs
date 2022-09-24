using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Infra.CrossCutting.ViewModels.Item
{
    public class ItemCreatedViewModel
    {
        public int Quantity { get; set; }
        public Guid IdProduct { get; set; }
    }
}
