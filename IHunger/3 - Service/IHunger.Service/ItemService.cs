using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class ItemService : BaseService, IItemService
    {
        private readonly IItemRepository _itemRepository;
        private readonly IProductRepository _productRepository;

        public ItemService(
            IItemRepository itemRepository,
            IProductRepository productRepository,
            INotifier notifier) : base(notifier)
        {
            _itemRepository = itemRepository;
            _productRepository = productRepository;
        }

        public async Task<Item> GetById(Guid id)
        {
            return await _itemRepository.GetById(id);
        }

        public async Task<List<Item>> GetByOrder(Guid orderId)
        {
            var items = await _itemRepository.Search(x => x.IdOrder == orderId);
            return items?.ToList() ?? new List<Item>();
        }

        public async Task<Item> Create(Item item)
        {
            var product = await _productRepository.GetById(item.IdProduct);

            if (product == null)
            {
                NotifyError("Product not found");
                return null;
            }

            if (item.Quantity <= 0)
            {
                NotifyError("Quantity must be greater than zero");
                return null;
            }

            item.Price = product.Price * item.Quantity;
            item.CreatedAt = DateTime.Now;

            await _itemRepository.Add(item);

            if (await _itemRepository.Commit())
            {
                return item;
            }

            NotifyError("Error inserting entity");
            return null;
        }

        public async Task<Item> Update(Item item)
        {
            var itemDb = await _itemRepository.GetById(item.Id);

            if (itemDb == null)
            {
                NotifyError("Item not found");
                return null;
            }

            var product = await _productRepository.GetById(item.IdProduct);

            if (product == null)
            {
                NotifyError("Product not found");
                return null;
            }

            itemDb.IdProduct = item.IdProduct;
            itemDb.Quantity = item.Quantity;
            itemDb.Price = product.Price * item.Quantity;

            _itemRepository.Update(itemDb);

            if (await _itemRepository.Commit())
            {
                return itemDb;
            }

            NotifyError("Error updating entity");
            return null;
        }

        public async Task<Item> Delete(Guid id)
        {
            var item = await _itemRepository.GetById(id);

            if (item == null)
            {
                NotifyError("Item not found");
                return null;
            }

            _itemRepository.Remove(id);

            if (await _itemRepository.Commit())
            {
                return item;
            }

            NotifyError("Error deleting entity");
            return null;
        }
    }
}
