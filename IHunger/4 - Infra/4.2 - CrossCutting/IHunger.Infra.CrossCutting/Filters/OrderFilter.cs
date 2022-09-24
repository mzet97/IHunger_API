using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Infra.CrossCutting.Filters
{
    public class OrderFilter : BaseFilter
    {
        public Guid IdProfileUser { get; set; }
    }
}
