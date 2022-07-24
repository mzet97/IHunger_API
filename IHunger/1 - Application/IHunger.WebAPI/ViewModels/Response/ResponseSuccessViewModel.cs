namespace IHunger.WebAPI.ViewModels.Response
{
    public class ResponseSuccessViewModel
    {

        public bool success { get; set; }
        public object data { get; set; }

        public ResponseSuccessViewModel()
        {

        }

        public ResponseSuccessViewModel(bool success, object data)
        {
            this.success = success;
            this.data = data;
        }
    }
}
