using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Domain.Models.Validations;
using IHunger.Infra.CrossCutting.Filters;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class CategoryRestaurantService : BaseService, ICategoryRestaurantService
    {
        private readonly ICategoryRestaurantRepository _categoryRestaurantRepository;

        public CategoryRestaurantService(
            ICategoryRestaurantRepository categoryRestaurantRepository,
            INotifier notifier) : base(notifier)
        {
            _categoryRestaurantRepository = categoryRestaurantRepository;
        }

        public async Task<CategoryRestaurant> Create(CategoryRestaurant categoryRestaurant)
        {
            if (!Validate(new CategoryRestaurantValidation(), categoryRestaurant)) return null;

            var categoryRestaurantDb = await _categoryRestaurantRepository
                .Search(x => x.Name == categoryRestaurant.Name);

            if (categoryRestaurantDb != null && categoryRestaurantDb.Any())
            {
                NotifyError("Already exists CategoryRestaurant the same name");
                return await Task.FromResult<CategoryRestaurant>(null);
            }

            await _categoryRestaurantRepository
                .Add(categoryRestaurant);

            if (await _categoryRestaurantRepository.Commit())
            {
                return await Task.FromResult(categoryRestaurant);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<CategoryRestaurant>(null);
        }

        public async Task<List<CategoryRestaurant>> GetAll()
        {
            return await _categoryRestaurantRepository
                .GetAll();
        }

        public async Task<List<CategoryRestaurant>> GetAllWithFilter(CategoryRestaurantFilter CategoryRestaurantFilter)
        {
            Expression<Func<CategoryRestaurant, bool>> filter = null;
            Func<IQueryable<CategoryRestaurant>, IOrderedQueryable<CategoryRestaurant>> ordeBy = null;

            if (!string.IsNullOrWhiteSpace(CategoryRestaurantFilter.Name))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryRestaurant>(true);
                }

                filter = filter.And(x => x.Name == CategoryRestaurantFilter.Name);
            }

            if (!string.IsNullOrWhiteSpace(CategoryRestaurantFilter.Description))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryRestaurant>(true);
                }

                filter = filter.And(x => x.Description == CategoryRestaurantFilter.Description);
            }

            if (!string.IsNullOrWhiteSpace(CategoryRestaurantFilter.Order))
            {
                switch (CategoryRestaurantFilter.Order)
                {
                    case "Id":
                        ordeBy = x => x.OrderBy(n => n.Id);
                        break;
                    case "Name":
                        ordeBy = x => x.OrderBy(n => n.Name);
                        break;
                    case "Description":
                        ordeBy = x => x.OrderBy(n => n.Description);
                        break;
                    case "CreatedAt":
                        ordeBy = x => x.OrderBy(n => n.CreatedAt);
                        break;
                }
            }

            if (CategoryRestaurantFilter.Id != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryRestaurant>(true);
                }

                filter = filter.And(x => x.Id == CategoryRestaurantFilter.Id);
            }

            if (CategoryRestaurantFilter.CreatedAt.Year > 1)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryRestaurant>(true);
                }

                filter = filter.And(x => x.CreatedAt == CategoryRestaurantFilter.CreatedAt);
            }

            return await _categoryRestaurantRepository
                .Search(
                    filter, 
                    ordeBy, 
                    CategoryRestaurantFilter.PageSize,
                    CategoryRestaurantFilter.PageIndex);
        }

        public async Task<CategoryRestaurant> GetById(Guid id)
        {
            return await _categoryRestaurantRepository
                .GetById(id);
        }

        public async Task<CategoryRestaurant> Update(CategoryRestaurant categoryRestaurant)
        {
            if (!Validate(new CategoryRestaurantValidation(), categoryRestaurant)) return null;

            var categoryRestaurantDb = await _categoryRestaurantRepository
                .GetById(categoryRestaurant.Id);

            if (categoryRestaurantDb == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<CategoryRestaurant>(null);
            }
            
            if(categoryRestaurantDb.Name != categoryRestaurant.Name)
            {
                categoryRestaurantDb.Name = categoryRestaurant.Name;
            }

            if (categoryRestaurantDb.Description != categoryRestaurant.Description)
            {
                categoryRestaurantDb.Description = categoryRestaurant.Description;
            }

            _categoryRestaurantRepository
                .Update(categoryRestaurantDb);

            if (await _categoryRestaurantRepository.Commit())
            {
                return await Task.FromResult(categoryRestaurantDb);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<CategoryRestaurant>(null);
        }

        public async Task<CategoryRestaurant> Delete(Guid id)
        {
            var categoryRestaurantDb = await _categoryRestaurantRepository
                .GetById(id);

            if (categoryRestaurantDb == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<CategoryRestaurant>(null);
            }

            _categoryRestaurantRepository
                .Remove(id);

            if (await _categoryRestaurantRepository.Commit())
            {
                return await Task.FromResult(categoryRestaurantDb);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<CategoryRestaurant>(null);
        }
    }
}
