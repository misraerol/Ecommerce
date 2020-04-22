using ECommerce.WEB.Models.AppUserManagement;
using ECommerce.CORE.Helper;
using ECommerce.WEB.Utility.Extension;
using ECommerce.WEB.Utility.Extension.Mail.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ECommerce.WEB.Utility.UIFramework;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.DATA;
using ECommerce.BIZ.Repository.SliderManagement;
using ECommerce.WEB.Models.SliderManagement;

namespace ECommerce.WEB.Controllers
{
    public class HomeController : BaseController
    {
        SliderRepository sliderRepository;
        public HomeController()
        {
            sliderRepository = new SliderRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            return View(appUserCRUDModel);
        }

        [HttpPost]
        public JsonResult Register(AppUserCRUDModel model)
        {

            Response response = new Response()
            {
                Message = "Kayıt Başarılı",
                Status = true,
                RedirectUrl = Url.Action("Index", "Home")
            };
            return Json(response);
        }

        public PartialViewResult _Slider()
        {
            List<SliderViewModel> sliderViewModel = sliderRepository.GetAllActiveList().Select(s => new SliderViewModel()
            {
                ImagePath = s.ImagePath,
                RedirectToUrl = s.RedirectUrl,
                Title = s.Title,
            }).ToList();
            return PartialView(sliderViewModel);
        }

    }
}