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
    public class RestaurantRepository : Repository<Restaurant>, IRestaurantRepository
    {
        public RestaurantRepository(DataIdentityDbContext db) : base(db)
        {
        }

        public override async Task<Restaurant> GetById(Guid id)
        {
            return await DbSet
                .Include(x => x.AddressRestaurant)
                .Include(x => x.CategoryRestaurant)
                .Include(x => x.Comments)
                .Where(x => x.Id == id)
                .AsNoTracking()
                .FirstOrDefaultAsync();
        }

        public override async Task<List<Restaurant>> Search(
            Expression<Func<Restaurant, bool>> predicate = null,
            Func<IQueryable<Restaurant>, IOrderedQueryable<Restaurant>> orderBy = null,
            int? pageSize = null,
            int? index = null)
        {
            var query = DbSet.AsQueryable();
            Count = query.Count();
            int pages = 0;
            query = query
                .Include(x => x.AddressRestaurant)
                .Include(x => x.CategoryRestaurant)
                .Include(x => x.Comments);

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
