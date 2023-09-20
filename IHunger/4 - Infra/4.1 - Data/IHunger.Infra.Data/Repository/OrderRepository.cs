using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using IHunger.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IHunger.Infra.Data.Repository
{
    public class OrderRepository : Repository<Order>, IOrderRepository
    {
        public OrderRepository(DataIdentityDbContext db) : base(db)
        {
        }

        public override async Task<Order> GetById(Guid id)
        {
            return await DbSet
                .Include("Coupon")
                .Include("ProfileUser")
                .Include("Items")
                .Include("Items.Product")
                .Include("Items.Product.CategoryProduct")
                .Include("Items.Product.Restaurant")
                .Include("Items.Product.Restaurant.Comments")
                .Include("Items.Product.Restaurant.AddressRestaurant")
                .Include("Items.Product.Restaurant.CategoryRestaurant")
                .Where(x => x.Id == id)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public override async Task<List<Order>> Search(
            Expression<Func<Order, bool>> predicate = null, 
            Func<IQueryable<Order>, IOrderedQueryable<Order>> orderBy = null, 
            int? pageSize = null, 
            int? pageIndex = null)
        {
            var query = DbSet.AsQueryable();
            Count = query.Count();
            int pages = 0;
            query = query
                .Include("Coupon")
                .Include("ProfileUser")
                .Include("Items")
                .Include("Items.Product")
                .Include("Items.Product.CategoryProduct")
                .Include("Items.Product.Restaurant")
                .Include("Items.Product.Restaurant.Comments")
                .Include("Items.Product.Restaurant.AddressRestaurant")
                .Include("Items.Product.Restaurant.CategoryRestaurant");

            if (predicate != null)
            {
                query = query.Where(predicate);
            }

            if (pageSize != null && pageSize.HasValue && pageSize > 0)
            {
                pages = Count / pageSize.Value;

                if (pageIndex != null && pageIndex.HasValue && pageIndex.Value > 0)
                {
                    if (pageIndex.Value > pages)
                    {
                        query = query.OrderBy(x => x.Id).Skip(pageSize.Value * pages).Take(pageSize.Value);
                    }
                    else
                    {
                        query = query.OrderBy(x => x.Id).Skip(pageSize.Value * pageIndex.Value).Take(pageSize.Value);
                    }

                }
                else
                {
                    query = query.OrderBy(x => x.Id).Skip(pageSize.Value);
                }

            }

            if (orderBy != null)
            {
                return await orderBy(query).ToListAsync();
            }

            return await query.ToListAsync();
        }
    }
}
