using AutoMapper;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Services;
using IHunger.WebAPI.Controllers;
using IHunger.WebAPI.Extensions;
using IHunger.WebAPI.ViewModels.Order.OrderStatus;
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
    [Route("api/v{version:apiVersion}/order-status")]
    public class OrderStatusController : MainController
    {
        private readonly IOrderStatusService _orderStatusService;
        private readonly IMapper _mapper;

        public OrderStatusController(
            IOrderStatusService orderStatusService,
            IMapper mapper,
            INotifier notifier, 
            IUser appUser) : base(notifier, appUser)
        {
            _orderStatusService = orderStatusService;
            _mapper = mapper;
        }

        [HttpGet]
        [ClaimsAuthorize("OrderStatus", "Get")]
        public async Task<IEnumerable<OrderStatusViewModel>> GetAllWithFilter()
        {
            return _mapper.Map<IEnumerable<OrderStatusViewModel>>(await _orderStatusService.GetAll());
        }

        [HttpGet("{id}")]
        [ClaimsAuthorize("OrderStatus", "Get")]
        public async Task<OrderStatusViewModel> GetById(Guid id)
        {
            return _mapper.Map<OrderStatusViewModel>(await _orderStatusService.GetById(id));
        }
    }
}
