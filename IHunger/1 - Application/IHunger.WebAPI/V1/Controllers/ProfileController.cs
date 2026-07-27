using AutoMapper;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Interfaces.Services;
using IHunger.WebAPI.Controllers;
using IHunger.WebAPI.Extensions;
using IHunger.WebAPI.ViewModels.User;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace IHunger.WebAPI.V1.Controllers
{
    [ApiVersion("1.0")]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/v{version:apiVersion}/profile")]
    public class ProfileController : MainController
    {
        private readonly IUserService _userService;
        private readonly IAuthService _authService;
        private readonly IMapper _mapper;

        public ProfileController(
            IUserService userService,
            IAuthService authService,
            IMapper mapper,
            INotifier notifier,
            IUser appUser) : base(notifier, appUser)
        {
            _userService = userService;
            _authService = authService;
            _mapper = mapper;
        }

        [HttpGet]
        [ClaimsAuthorize("Profile", "Get")]
        public async Task<ActionResult<UserTokenViewModel>> GetProfile()
        {
            var userId = AppUser.GetUserId();
            var user = await _userService.GetById(userId);

            if (user == null) return NotFound();

            var jwt = await _authService.GetJwt(user.Email);
            return CustomResponse(jwt);
        }

        [HttpPut]
        [ClaimsAuthorize("Profile", "Update")]
        public async Task<ActionResult<RegisterUserViewModel>> UpdateProfile(RegisterUserViewModel viewModel)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var userId = AppUser.GetUserId();
            var user = await _userService.GetById(userId);

            if (user == null) return NotFound();

            user.UserName = viewModel.Email;
            user.Email = viewModel.Email;
            user.PhoneNumber = viewModel.PhoneNumber;

            var result = await _userService.Update(user);

            return CustomResponse(_mapper.Map<RegisterUserViewModel>(result));
        }
    }
}
