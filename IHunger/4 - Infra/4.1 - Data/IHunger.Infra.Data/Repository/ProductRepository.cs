using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using IHunger.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Infra.Data.Repository
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {
        public ProductRepository(DataIdentityDbContext db) : base(db)
        {
        }

        public override async Task<Product> GetById(Guid id)
        {
            return await DbSet
                .Include(x => x.Restaurant)
                .Include(x => x.CategoryProduct)
                .Where(x => x.Id == id)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public async Task<List<Product>> GetByRestaurant(Guid id)
        {
            return await DbSet
                .Include(x => x.Restaurant)
                .Include(x => x.CategoryProduct)
                .Where(x => x.IdRestaurant == id)
                .ToListAsync();
        }

        public async Task<Product> GetByRestaurantByIdProduct(Guid idRestaurant, Guid idProduct)
        {
            return await DbSet
                .Include(x => x.Restaurant)
                .Include(x => x.CategoryProduct)
                .Where(x => x.IdRestaurant == idRestaurant && x.Id == idProduct)
                .FirstOrDefaultAsync();
        }

        public override async Task<List<Product>> Search(
            Expression<Func<Product, bool>> predicate = null,
            Func<IQueryable<Product>, IOrderedQueryable<Product>> orderBy = null,
            int? pageSize = null,
            int? index = null)
        {
            var query = DbSet.AsQueryable();
            query = query.Include(x => x.Restaurant).Include(x => x.CategoryProduct);
            Count = query.Count();
            
            int pages = 0;

            if (predicate != null)
            {
                query = query.Where(predicate);
            }

            if (pageSize != null && pageSize.HasValue && pageSize > 0)
            {
                pages = Count / pageSize.Value;

                if (index != null && index.HasValue && index.Value > 0)
                {
                    if (index.Value > pages)
                    {
                        query = query.OrderBy(x => x.Id).Skip(pageSize.Value * pages).Take(pageSize.Value);
                    }
                    else
                    {
                        query = query.OrderBy(x => x.Id).Skip(pageSize.Value * index.Value).Take(pageSize.Value);
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
