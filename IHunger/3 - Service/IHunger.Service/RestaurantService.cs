﻿using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Repository;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Domain.Models.Validations;
using IHunger.Infra.CrossCutting.Filters;
using LinqKit;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace IHunger.Service
{
    public class RestaurantService : BaseService, IRestaurantService
    {
        private readonly IRestaurantRepository _restaurantRepository;
        private readonly ICategoryRestaurantRepository _categoryRestaurantRepository;

        public RestaurantService(
            IRestaurantRepository restaurantRepository,
            ICategoryRestaurantRepository categoryRestaurantRepository,
            INotifier notifier) : base(notifier)
        {
            _restaurantRepository = restaurantRepository;
            _categoryRestaurantRepository = categoryRestaurantRepository;
        }

        public async Task<Restaurant> Create(Restaurant restaurant)
        {
            if (!Validate(new RestaurantValidation(), restaurant)) return null;
            if (!Validate(new AddressRestaurantValidation(), restaurant.AddressRestaurant)) return null;

            var restaurantBD = await _restaurantRepository
                .Search(x => x.Name == restaurant.Name);

            if (restaurantBD != null && restaurantBD.Any())
            {
                NotifyError("Already exists restaurant the same name");
                return await Task.FromResult<Restaurant>(null);
            }

            var categoryRestaurant = await _categoryRestaurantRepository
                .GetById(restaurant.IdCategoryRestaurant);

            if (categoryRestaurant == null)
            {
                NotifyError("Not fround categoryRestaurant");
                return await Task.FromResult<Restaurant>(null);
            }

            await _restaurantRepository
                .Add(restaurant);

            if (await _restaurantRepository.Commit())
            {
                return await Task.FromResult(restaurant);
            }

            NotifyError("Error inserting entity");
            return await Task.FromResult<Restaurant>(null);
        }

        public async Task<List<Restaurant>> GetAllWithFilter(RestaurantFilter restaurantFilter)
        {
            Expression<Func<Restaurant, bool>> filter = null;
            Func<IQueryable<Restaurant>, IOrderedQueryable<Restaurant>> ordeBy = null;

            if (!string.IsNullOrWhiteSpace(restaurantFilter.Name))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.Name == restaurantFilter.Name);
            }

            if (!string.IsNullOrWhiteSpace(restaurantFilter.Description))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.Description == restaurantFilter.Description);
            }

            if (!string.IsNullOrWhiteSpace(restaurantFilter.CategoryName))
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.CategoryRestaurant.Name == restaurantFilter.CategoryName);
            }

            if (!string.IsNullOrWhiteSpace(restaurantFilter.Order))
            {
                switch (restaurantFilter.Order)
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

            if (restaurantFilter.Id != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.Id == restaurantFilter.Id);
            }

            if (restaurantFilter.CategoryId != Guid.Empty)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.CategoryRestaurant.Id == restaurantFilter.CategoryId);
            }

            if (restaurantFilter.CreatedAt.Year > 1)
            {
                if (filter == null)
                {
                    filter = PredicateBuilder.New<Restaurant>(true);
                }

                filter = filter.And(x => x.Id == restaurantFilter.Id);
            }

            return await _restaurantRepository
                .Search(
                    filter,
                    ordeBy,
                    restaurantFilter.PageSize,
                    restaurantFilter.PageIndex);
        }

        public async Task<Restaurant> GetById(Guid id)
        {
            return await _restaurantRepository
                .GetById(id);
        }

        public async Task<Restaurant> Update(Restaurant restaurant)
        {
            if (!Validate(new RestaurantValidation(), restaurant)) return null;

            var restaurantDB = await _restaurantRepository
                .GetById(restaurant.Id);

            if (restaurantDB == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Restaurant>(null);
            }

            if (restaurant.CategoryRestaurant != null)
            {
                if (!Validate(new AddressRestaurantValidation(), restaurant.AddressRestaurant)) return null;

                var categoryRestaurant = await _categoryRestaurantRepository
                    .GetById(restaurant.IdCategoryRestaurant);

                if (categoryRestaurant == null)
                {
                    NotifyError("Not fround categoryRestaurant");
                    return await Task.FromResult<Restaurant>(null);
                }

            }

            if (restaurant.AddressRestaurant != null)
            {
                if (restaurantDB.AddressRestaurant.Street != restaurant.AddressRestaurant.Street)
                {
                    restaurantDB.AddressRestaurant.Street = restaurant.AddressRestaurant.Street;
                }

                if (restaurantDB.AddressRestaurant.District != restaurant.AddressRestaurant.District)
                {
                    restaurantDB.AddressRestaurant.District = restaurant.AddressRestaurant.District;
                }

                if (restaurantDB.AddressRestaurant.City != restaurant.AddressRestaurant.City)
                {
                    restaurantDB.AddressRestaurant.City = restaurant.AddressRestaurant.City;
                }

                if (restaurantDB.AddressRestaurant.County != restaurant.AddressRestaurant.County)
                {
                    restaurantDB.AddressRestaurant.County = restaurant.AddressRestaurant.County;
                }

                if (restaurantDB.AddressRestaurant.ZipCode != restaurant.AddressRestaurant.ZipCode)
                {
                    restaurantDB.AddressRestaurant.ZipCode = restaurant.AddressRestaurant.ZipCode;
                }

                if (restaurantDB.AddressRestaurant.Latitude != restaurant.AddressRestaurant.Latitude)
                {
                    restaurantDB.AddressRestaurant.Latitude = restaurant.AddressRestaurant.Latitude;
                }

                if (restaurantDB.AddressRestaurant.Longitude != restaurant.AddressRestaurant.Longitude)
                {
                    restaurantDB.AddressRestaurant.Longitude = restaurant.AddressRestaurant.Longitude;
                }
            }

            if (restaurantDB.Name != restaurant.Name)
            {
                restaurantDB.Name = restaurant.Name;
            }

            if (restaurantDB.Description != restaurant.Description)
            {
                restaurantDB.Description = restaurant.Description;
            }

            if (restaurantDB.Image != restaurant.Image)
            {
                restaurantDB.Image = restaurant.Image;
            }

            _restaurantRepository
                .Update(restaurantDB);

            if (await _restaurantRepository.Commit())
            {
                return await Task.FromResult(restaurantDB);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Restaurant>(null);
        }

        public async Task<Restaurant> Delete(Guid id)
        {
            var restaurant = await _restaurantRepository
                .GetById(id);

            if (restaurant == null)
            {
                NotifyError("Not found");
                return await Task.FromResult<Restaurant>(null);
            }

            _restaurantRepository
                .Remove(id);

            if (await _restaurantRepository.Commit())
            {
                return await Task.FromResult(restaurant);
            }

            NotifyError("Error deleting entity");
            return await Task.FromResult<Restaurant>(null);
        }
    }
}
