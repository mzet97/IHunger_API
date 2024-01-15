using FluentValidation;
using FluentValidation.Results;
using IHunger.Domain.Interfaces;
using IHunger.Domain.Models;
using IHunger.Domain.Notifications;

namespace IHunger.Service
{
    public abstract class BaseService
    {
        private readonly INotifier _notifier;

        protected BaseService(INotifier notifier)
        {
            _notifier = notifier;
        }

        protected void NotifyError(ValidationResult validationResult)
        {
            foreach (var error in validationResult.Errors)
            {
                NotifyError(error.ErrorMessage);
            }
        }

        protected void NotifyError(string mensagem)
        {
            _notifier.Handle(new Notification(mensagem));
        }

        protected bool Validate<TV, TE>(TV validation, TE entity) where TV : AbstractValidator<TE> where TE : Entity
        {
            var validator = validation.Validate(entity);

            if (validator.IsValid) return true;

            NotifyError(validator);

            return false;
        }
    }
}
