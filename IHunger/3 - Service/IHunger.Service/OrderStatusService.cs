using IHunger.Domain.Interfaces;
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
        public OrderStatusService(
            INotifier notifier,
            IUnitOfWork unitOfWork) : base(notifier, unitOfWork)
        {

        }

        public async Task<List<OrderStatus>> GetAll()
        {
            return await _unitOfWork
               .RepositoryFactory
               .OrderStatusRepository
               .GetAll();
        }

        public async Task<OrderStatus> GetById(Guid id)
        {
            return await _unitOfWork
              .RepositoryFactory
              .OrderStatusRepository
              .GetById(id);
        }

    }
}
