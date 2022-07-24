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
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class ProductService : BaseService, IProductService
    {
        private readonly IRestaurantRepository _restaurantRepository;
        private readonly IProductRepository _productRepository;
        private readonly ICategoryProductRepository _categoryProductRepository;

        public ProductService(
            IRestaurantRepository restaurantRepository, 
            IProductRepository productRepository, 
            ICategoryProductRepository categoryProductRepository, 
            INotifier notifier) : base(notifier)
        {
            _restaurantRepository = restaurantRepository;
            _productRepository = productRepository;
            _categoryProductRepository = categoryProductRepository;
        }

        public async Task<Product> Create(Product product)
        {
            if (!Validate(new ProductValidation(), product)) return null;

            var restaurant = await _restaurantRepository
                .GetById(product.IdRestaurant);

            if (restaurant == null)
            {
                NotifyError("Not fround restaurant");
                return await Task.FromResult<Product>(null);
            }

            var categoryProduct = await _categoryProductRepository
                .GetById(product.IdCategoryProduct);

            if (categoryProduct == null)
            {
                NotifyError("Not fround categoryProduct");
                return await Task.FromResult<Product>(null);
            }

            await _productRepository
                .Add(product);

            if (await _productRepository.Commit())
            {
                return await Task.FromResult(product);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<Product>(null);
        }

        public async Task<List<Product>> GetAllWithFilter(ProductFilter productFilter)
        {
            Expression<Func<Product, bool>> filter = null;
            Func<IQueryable<Product>, IOrderedQueryable<Product>> ordeBy = null;

            if (!string.IsNullOrWhiteSpace(productFilter.Name))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Name == productFilter.Name);
            }

            if (productFilter.Id != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Id == productFilter.Id);
            }

            if (productFilter.IdCategoryProduct != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.CategoryProduct.Id == productFilter.IdCategoryProduct);
            }

            if (!string.IsNullOrWhiteSpace(productFilter.Description))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Description == productFilter.Description);
            }

            if (productFilter.Kosher)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Kosher == productFilter.Kosher);
            }

            if (productFilter.Vegan)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Vegan == productFilter.Vegan);
            }

            if (productFilter.Vegetarian)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Vegetarian == productFilter.Vegetarian);
            }

            if (!string.IsNullOrWhiteSpace(productFilter.NameCategoryProduct))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.CategoryProduct.Name == productFilter.NameCategoryProduct);
            }

            if (productFilter.CreatedAt.Year > 1)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Product>(true);
                }

                filter = filter.And(x => x.Id == productFilter.Id);
            }

            if (!string.IsNullOrWhiteSpace(productFilter.Order))
            {
                switch (productFilter.Order)
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
                    case "Price":
                        ordeBy = x => x.OrderBy(n => n.Price);
                        break;
                    case "CreatedAt":
                        ordeBy = x => x.OrderBy(n => n.CreatedAt);
                        break;
                }
            }

            return await _productRepository
                .Search(
                    filter,
                    ordeBy,
                    productFilter.PageSize,
                    productFilter.PageIndex);
        }

        public async Task<Product> GetById(Guid id)
        {
            return await _productRepository
                .GetById(id);
        }

        public async Task<Product> Update(Product product)
        {
            if (!Validate(new ProductValidation(), product)) return null;

            var productDB = await _productRepository
                .GetById(product.Id);

            if (productDB == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Product>(null);
            }

            if (product.CategoryProduct != null)
            {
                var categoryProduct = await _categoryProductRepository
                    .GetById(product.IdCategoryProduct);

                if (categoryProduct == null)
                {
                    NotifyError("Not fround categoryProduct");
                    return await Task.FromResult<Product>(null);
                }

            }

            if (productDB.Name != product.Name)
            {
                productDB.Name = product.Name;
            }

            if (productDB.Description != product.Description)
            {
                productDB.Description = product.Description;
            }

            if (productDB.Price != product.Price)
            {
                productDB.Price = product.Price;
            }

            if (productDB.Kosher != product.Kosher)
            {
                productDB.Kosher = product.Kosher;
            }

            if (productDB.Vegan != product.Vegan)
            {
                productDB.Vegan = product.Vegan;
            }

            if (productDB.Vegetarian != product.Vegetarian)
            {
                productDB.Vegetarian = product.Vegetarian;
            }

            if (productDB.Image != product.Image)
            {
                productDB.Image = product.Image;
            }

            _productRepository
                .Update(productDB);

            if (await _productRepository.Commit())
            {
                return await Task.FromResult(productDB);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Product>(null);
        }

        public async Task<Product> Delete(Guid id)
        {
            var product = await _productRepository
                .GetById(id);

            if (product == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Product>(null);
            }

            _productRepository
                .Remove(id);

            if (await _productRepository.Commit())
            {
                return await Task.FromResult(product);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Product>(null);
        }

        public async Task<List<Product>> GetByRestaurant(Guid id)
        {
            var restaurant = await _restaurantRepository
                .GetById(id);

            if(restaurant == null)
            {
                NotifyError("Not fround Restaurant");
                return await Task.FromResult<List<Product>>(null);
            }

            return await _productRepository
                 .GetByRestaurant(id);
        }

        public async Task<Product> GetByRestaurantByIdProduct(Guid idRestaurant, Guid idProduct)
        {
            var restaurant = await _restaurantRepository
                .GetById(idRestaurant);

            if (restaurant == null)
            {
                NotifyError("Not fround Restaurant");
                return await Task.FromResult<Product>(null);
            }

            return await _productRepository
                 .GetByRestaurantByIdProduct(idRestaurant, idProduct);
        }
    }
}
