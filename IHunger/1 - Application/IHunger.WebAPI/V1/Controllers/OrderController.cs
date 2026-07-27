using AutoMapper;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Services;
using IHunger.Domain.Models;
using IHunger.Infra.CrossCutting.Filters;
using IHunger.Infra.CrossCutting.ViewModels.Order;
using IHunger.Service;
using IHunger.WebAPI.Controllers;
using IHunger.WebAPI.Extensions;
using IHunger.WebAPI.ViewModels.Order;
using IHunger.WebAPI.ViewModels.Restaurant;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
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

            var categoryProduct = await _orderService.Create(viewModel);

            var resp = _mapper.Map<OrderViewModel>(categoryProduct);

            return CustomResponse(resp);
            
        }

        [HttpGet]
        [ClaimsAuthorize("Order", "Get")]
        public async Task<IEnumerable<OrderViewModel>> GetAllWithFilter([FromQuery] OrderFilter filter)
        {
            return _mapper.Map<IEnumerable<OrderViewModel>>(await _orderService.GetAllWithFilter(filter));
        }

        [HttpPut("{id}")]
        [ClaimsAuthorize("Order", "Update")]
        public async Task<ActionResult<OrderViewModel>> Update([FromRoute] Guid id, [FromBody] OrderViewModel viewModel)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);
            if (id != viewModel.Id) return NotFound();

            var entity = await _orderService.Update(_mapper.Map<Order>(viewModel));

            var resp = _mapper.Map<OrderViewModel>(entity);

            return CustomResponse(resp);
        }

        [HttpDelete("{id}")]
        [ClaimsAuthorize("Order", "Delete")]
        public async Task<OrderViewModel> Delete(Guid id)
        {
            return _mapper.Map<OrderViewModel>(await _orderService.Delete(id));
        }

        [HttpPut("{id}/status/{status}")]
        [ClaimsAuthorize("Order", "Update")]
        public async Task<ActionResult<OrderViewModel>> UpdateStatus([FromRoute] Guid id, [FromRoute] int status)
        {
            var entity = await _orderService.UpdateStatus(id, (IHunger.Domain.Enumeration.TypeOrderStatus)status);
            return CustomResponse(_mapper.Map<OrderViewModel>(entity));
        }

        [HttpPut("{idOrder}/itens/{idItem}")]
        [ClaimsAuthorize("Order", "Update")]
        public async Task<ActionResult<OrderViewModel>> CreateUpdateItem([FromRoute] Guid idOrder, [FromRoute] Guid idItem, [FromBody] ItemCreatedViewModel itemViewModel)
        {
            var item = _mapper.Map<Item>(itemViewModel);
            item.Id = idItem;
            var entity = await _orderService.AddItem(idOrder, item);
            return CustomResponse(_mapper.Map<OrderViewModel>(entity));
        }

        [HttpDelete("{idOrder}/itens/{idItem}")]
        [ClaimsAuthorize("Order", "Delete")]
        public async Task<ActionResult<OrderViewModel>> DeleteItem([FromRoute] Guid idOrder, [FromRoute] Guid idItem)
        {
            var entity = await _orderService.RemoveItem(idOrder, idItem);
            return CustomResponse(_mapper.Map<OrderViewModel>(entity));
        }
    }
}
