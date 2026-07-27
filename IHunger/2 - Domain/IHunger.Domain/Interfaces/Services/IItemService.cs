using IHunger.Domain.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace IHunger.Domain.Interfaces.Services
{
    public interface IItemService
    {
        Task<Item> GetById(Guid id);
        Task<List<Item>> GetByOrder(Guid orderId);
        Task<Item> Create(Item item);
        Task<Item> Update(Item item);
        Task<Item> Delete(Guid id);
    }
}
