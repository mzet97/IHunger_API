using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Models;
using IHunger.Infra.Data.Context;

namespace IHunger.Infra.Data.Repository
{
    public class CategoryRestaurantRepository : Repository<CategoryRestaurant>, ICategoryRestaurantRepository
    {
        public CategoryRestaurantRepository(DataIdentityDbContext db) : base(db)
        {
        }
    }
}
