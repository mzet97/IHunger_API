using AutoMapper;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.Filters;
using IHunger.WebAPI.Controllers;
using IHunger.WebAPI.Extensions;
using IHunger.WebAPI.ViewModels.Order;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IHunger.WebAPI.V1.Controllers
{
    [ApiVersion("1.0")]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/v{version:apiVersion}/orders")]
    public class OrderController : MainController
    {
        private readonly IOrderService _orderService;
        private readonly IMapper _mapper;

        public OrderController(
            IOrderService orderService,
            IMapper mapper,
            INotifier notifier, 
            IUser appUser) : base(notifier, appUser)
        {
            _orderService = orderService;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        [ClaimsAuthorize("Order", "Get")]
        public async Task<OrderViewModel> GetById(Guid id)
        {
            return _mapper.Map<OrderViewModel>(await _orderService.GetById(id));
        }

        [HttpPost]
        [ClaimsAuthorize("Order", "Create")]
        public async Task<ActionResult<OrderViewModel>> Create(OrderCreatedViewModel viewModel)
        {
            
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var categoryProduct = await _orderService.Create(_mapper.Map<Order>(viewModel));

            var resp = _mapper.Map<OrderViewModel>(categoryProduct);

            return CustomResponse(resp);
            
        }

        [HttpGet]
        [ClaimsAuthorize("Order", "Get")]
        public async Task<IEnumerable<OrderViewModel>> GetAllWithFilter([FromQuery] OrderFilter filter)
        {
            return _mapper.Map<IEnumerable<OrderViewModel>>(await _orderService.GetAllWithFilter(filter));
        }
    }
}
