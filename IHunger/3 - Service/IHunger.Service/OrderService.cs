using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.Filters;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class OrderService : BaseService, IOrderService
    {
        public OrderService(
            INotifier notifier, 
            IUnitOfWork unitOfWork) : 
            base(notifier, unitOfWork)
        {
        }

        public Task<Order> Create(Order order)
        {
            throw new NotImplementedException();
        }

        public Task<Order> Delete(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<List<Order>> GetAllWithFilter(OrderFilter orderFilter)
        {
            throw new NotImplementedException();
        }

        public Task<Order> GetById(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<Order> Update(Order order)
        {
            throw new NotImplementedException();
        }
    }
}
