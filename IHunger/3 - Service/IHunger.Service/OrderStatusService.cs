using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class OrderStatusService : BaseService, IOrderStatusService
    {
        private readonly IOrderStatusRepository _orderStatusRepository;

        public OrderStatusService(
            IOrderStatusRepository orderStatusRepository,
            INotifier notifier) : base(notifier)
        {
            _orderStatusRepository = orderStatusRepository;
        }

        public async Task<List<OrderStatus>> GetAll()
        {
            return await _orderStatusRepository
               .GetAll();
        }

        public async Task<OrderStatus> GetById(Guid id)
        {
            return await _orderStatusRepository
              .GetById(id);
        }

    }
}
