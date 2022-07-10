using IHunger.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IOrderStatusService
    {
        Task<List<OrderStatus>> GetAll();
        Task<OrderStatus> GetById(Guid id);
    }
}
