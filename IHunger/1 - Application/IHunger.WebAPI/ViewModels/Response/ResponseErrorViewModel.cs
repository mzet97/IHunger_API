using System.Collections.Generic;

namespace IHunger.WebAPI.ViewModels.Response
{
    public class ResponseErrorViewModel
    {
        public bool success { get; set; }
        public IEnumerable<string> errors { get; set; }

        public ResponseErrorViewModel()
        {

        }

        public ResponseErrorViewModel(bool success, IEnumerable<string> errors)
        {
            this.success = success;
            this.errors = errors;
        }
    }
}
