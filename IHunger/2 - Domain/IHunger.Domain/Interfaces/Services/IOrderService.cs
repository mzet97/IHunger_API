using IHunger.Domain.Enumeration;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.Filters;
using IHunger.Infra.CrossCutting.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IOrderService
    {
        Task<Order> Create(OrderCreatedViewModel viewModel);
        Task<List<Order>> GetAllWithFilter(OrderFilter orderFilter);
        Task<Order> GetById(Guid id);
        Task<Order> Update(Order order);
        Task<Order> UpdateStatus(Guid id, TypeOrderStatus status);
        Task<Order> AddItem(Guid orderId, Item item);
        Task<Order> RemoveItem(Guid orderId, Guid itemId);
        Task<Order> Delete(Guid id);
    }
}
