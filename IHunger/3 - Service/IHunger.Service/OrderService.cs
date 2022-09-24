using IHunger.Domain.Enumeration;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.Filters;
using IHunger.Infra.CrossCutting.ViewModels.Order;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class OrderService : BaseService, IOrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IProductRepository _productRepository;
        private readonly IProfileUserRepository _profileUserRepository;
        private readonly ICouponRepository _couponRepository;

        public OrderService(
            IOrderRepository orderRepository,
            IProductRepository productRepository,
            IProfileUserRepository profileUserRepository,
            ICouponRepository couponRepository,
            INotifier notifier) : 
            base(notifier)
        {
            _orderRepository = orderRepository;
            _productRepository = productRepository;
            _profileUserRepository = profileUserRepository;
            _couponRepository = couponRepository;
        }

        public async Task<Order> Create(OrderCreatedViewModel viewModel)
        {
            var order = new Order();
            
            order.IdProfileUser = viewModel.IdProfileUser;

            if(viewModel.IdProfileUser != null)
            {
                var profile = await _profileUserRepository.GetById(viewModel.IdProfileUser.Value);

                if(profile == null)
                {
                    NotifyError("Not fround profile");
                    return await Task.FromResult<Order>(null);
                }

                order.IdProfileUser = viewModel.IdProfileUser;
            }

            Coupon coupon = null;
            if(viewModel.IdCoupon != null)
            {
                coupon = await _couponRepository.GetById(viewModel.IdCoupon.Value);

                if(coupon == null)
                {
                    NotifyError("Not fround coupon");
                    return await Task.FromResult<Order>(null);
                }

                order.IdCoupon = viewModel.IdCoupon;
            }

            order.OrderStatus = (TypeOrderStatus)GetTypeOrderStatus(viewModel.OrderStatus);

            var listItens = new List<Item>();
            foreach(var itemViewModel in viewModel.Items)
            {
                if (itemViewModel.Quantity <= 0) continue; 

                var product = await _productRepository.GetById(itemViewModel.IdProduct);

                if(product == null)
                {
                    NotifyError("Not fround product");
                    return await Task.FromResult<Order>(null);
                }

                var item = new Item();
                item.IdProduct = itemViewModel.IdProduct;
                item.Quantity = itemViewModel.Quantity;

                item.Price = product.Price * item.Quantity;
                item.CreatedAt = DateTime.Now;

                listItens.Add(item);
            }

            order.Items = listItens;

            order.Price = order.Items.Sum(x => x.Price);

            if(order.Coupon != null)
            {
                var totalDiscount = (order.Price * order.Coupon.Value) / 100;
                order.Price = order.Price - totalDiscount;
            }

            order.CreatedAt= DateTime.Now;

            await _orderRepository.Add(order);

            if(await _orderRepository.Commit())
            {
                return await Task.FromResult(order);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<Order>(null);
        }

        public async Task<List<Order>> GetAllWithFilter(OrderFilter orderFilter)
        {
            Expression<Func<Order, bool>> filter = null;
            Func<IQueryable<Order>, IOrderedQueryable<Order>> ordeBy = null;

            if (orderFilter.Id != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Order>(true);
                }

                filter = filter.And(x => x.Id == orderFilter.Id);
            }

            if (orderFilter.IdProfileUser != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Order>(true);
                }

                filter = filter.And(x => x.IdProfileUser == orderFilter.IdProfileUser);
            }

            if (orderFilter.CreatedAt.Year > 1)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Order>(true);
                }

                filter = filter.And(x => x.Id == orderFilter.Id);
            }

            if (!string.IsNullOrWhiteSpace(orderFilter.Order))
            {
                switch (orderFilter.Order)
                {
                    case "Id":
                        ordeBy = x => x.OrderBy(n => n.Id);
                        break;
                    case "OrderStatus":
                        ordeBy = x => x.OrderBy(n => n.OrderStatus);
                        break;
                    case "Price":
                        ordeBy = x => x.OrderBy(n => n.Price);
                        break;
                    case "CreatedAt":
                        ordeBy = x => x.OrderBy(n => n.CreatedAt);
                        break;
                }
            }

            return await _orderRepository
                .Search(
                    filter,
                    ordeBy,
                    orderFilter.PageSize,
                    orderFilter.PageIndex);
        }

        public async Task<Order> GetById(Guid id)
        {
            return await _orderRepository
                .GetById(id);
        }

        public Task<Order> Update(Order order)
        {
            throw new NotImplementedException();
        }

        public async Task<Order> Delete(Guid id)
        {
            var order = await _orderRepository
                .GetById(id);

            if (order == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Order>(null);
            }

            _orderRepository
                .Remove(id);

            if (await _orderRepository.Commit())
            {
                return await Task.FromResult(order);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Order>(null);
        }

        private int GetTypeOrderStatus(string value)
        {
            if (string.IsNullOrEmpty(value)) return 0;
            if (value.ToUpper() == TypeOrderStatus.WaitingForPayment.ToString().ToUpper()) return 1;
            if (value.ToUpper() == TypeOrderStatus.Paid.ToString().ToUpper()) return 2;
            if (value.ToUpper() == TypeOrderStatus.Preparing.ToString().ToUpper()) return 3;
            if (value.ToUpper() == TypeOrderStatus.OutForDelivery.ToString().ToUpper()) return 4;
            if (value.ToUpper() == TypeOrderStatus.Delivered.ToString().ToUpper()) return 5;

            return 0;
        }
    }
}
