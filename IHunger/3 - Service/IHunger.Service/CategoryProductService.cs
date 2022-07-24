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
    public class CategoryProductService : BaseService, ICategoryProductService
    {
        private readonly ICategoryProductRepository _categoryProductRepository;
        public CategoryProductService(
            INotifier notifier,
            ICategoryProductRepository categoryProductRepository) : base(notifier)
        {
            _categoryProductRepository = categoryProductRepository;
        }

        public async Task<CategoryProduct> Create(CategoryProduct categoryProduct)
        {
            if (!Validate(new CategoryProductValidation(), categoryProduct)) return null;

            var categoryProductBD =  await _categoryProductRepository
                .Search(x => x.Name == categoryProduct.Name);

            if(categoryProductBD != null && categoryProductBD.Any())
            {
                NotifyError("Already exists categoryProduct the same name");
                return await Task.FromResult<CategoryProduct>(null);
            }

            await _categoryProductRepository
                .Add(categoryProduct);

            if(await _categoryProductRepository.Commit())
            {
                return await Task.FromResult(categoryProduct);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<CategoryProduct>(null);
        }

        public async Task<List<CategoryProduct>> GetAll()
        {
            return await _categoryProductRepository
                .GetAll();
        }

        public async Task<List<CategoryProduct>> GetAllWithFilter(CategoryProductFilter categoryProductFilter)
        {
            Expression<Func<CategoryProduct, bool>> filter = null;
            Func<IQueryable<CategoryProduct>, IOrderedQueryable<CategoryProduct>> ordeBy = null;

            if (!string.IsNullOrWhiteSpace(categoryProductFilter.Name))
            {
                if(filter == null)
                {
                    filter = PredicateBuilder.New<CategoryProduct>(true);
                }

                filter = filter.And(x => x.Name == categoryProductFilter.Name || x.Name.Contains(categoryProductFilter.Name));
            }

            if (!string.IsNullOrWhiteSpace(categoryProductFilter.Description))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryProduct>(true);
                }

                filter = filter.And(x => x.Description == categoryProductFilter.Description || x.Name.Contains(categoryProductFilter.Description));
            }

            if (!string.IsNullOrWhiteSpace(categoryProductFilter.Order))
            {
                switch (categoryProductFilter.Order)
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
                    case "UpdatedAt":
                        ordeBy = x => x.OrderBy(n => n.CreatedAt);
                        break;
                }
            }

            if(categoryProductFilter.Id != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryProduct>(true);
                }

                filter = filter.And(x => x.Id == categoryProductFilter.Id);
            }

            if (categoryProductFilter.CreatedAt.Year > 1)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<CategoryProduct>(true);
                }

                filter = filter.And(x => x.Id == categoryProductFilter.Id);
            }

            return await _categoryProductRepository
                .Search(
                    filter, 
                    ordeBy,
                    categoryProductFilter.PageSize,
                    categoryProductFilter.PageIndex);
        }

        public async Task<CategoryProduct> GetById(Guid id)
        {
            return await _categoryProductRepository
                .GetById(id);
        }

        public async Task<CategoryProduct> Update(CategoryProduct categoryProduct)
        {
            if (!Validate(new CategoryProductValidation(), categoryProduct)) return null;

            var categoryProductDb = await _categoryProductRepository
                .GetById(categoryProduct.Id);

            if (categoryProductDb == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<CategoryProduct>(null);
            }

            if (categoryProductDb.Name != categoryProduct.Name)
            {
                categoryProductDb.Name = categoryProduct.Name;
            }

            if (categoryProductDb.Description != categoryProduct.Description)
            {
                categoryProductDb.Description = categoryProduct.Description;
            }

            _categoryProductRepository
                 .Update(categoryProductDb);

            if (await _categoryProductRepository.Commit())
            {
                return await Task.FromResult<CategoryProduct>(categoryProductDb);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<CategoryProduct>(null);
        }

        public async Task<CategoryProduct> Delete(Guid id)
        {
            var categoryProduct = await _categoryProductRepository
                .GetById(id);

            if(categoryProduct == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<CategoryProduct>(null);
            }

            _categoryProductRepository
                  .Remove(id);

            if (await _categoryProductRepository.Commit())
            {
                return await Task.FromResult(categoryProduct);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<CategoryProduct>(null);
        }
    }
}
