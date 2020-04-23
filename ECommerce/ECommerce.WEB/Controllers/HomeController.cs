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
using ECommerce.BIZ.Repository.AppUserManagement;

namespace ECommerce.WEB.Controllers
{
    public class HomeController : BaseController
    {
        SliderRepository sliderRepository;
        AppUserRepository appUserRepository;
        public HomeController()
        {
            sliderRepository = new SliderRepository();
            appUserRepository = new AppUserRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            appUserCRUDModel.BirthDate = DateTime.Now.AddYears(-20);
            return View(appUserCRUDModel);
        }

        [HttpPost]
        public JsonResult Register(AppUserCRUDModel appUserCRUDModel)
        {
            Response response;
            bool anyUserEmail = appUserRepository.AnyUserEmail(appUserCRUDModel.Email);
            if (anyUserEmail)
            {
                response = new Response()
                {
                    Message = "Mail Adresi sistemde Kayıtlı",
                    Status = false,
                };
            }
            if (appUserCRUDModel.Password == appUserCRUDModel.RePassword)
            {
                response = new Response()
                {
                    Message = "Şifreler eşleşmedi",
                    Status = false
                };
            }
            AppUser appUser = new AppUser()
            {
                Password = appUserCRUDModel.Password,
                Email = appUserCRUDModel.Email,
                BirthDate = appUserCRUDModel.BirthDate,
                CreateDate = DateTime.Now,
                FirstName = appUserCRUDModel.FirstName,
                LastName = appUserCRUDModel.LastName,
                IsWantNotification = appUserCRUDModel.IsWantNotification,
                IsActivation = true,
                IsActive = true,
                IsDeleted = false
            };
            appUserRepository.Insert(appUser);
            response = new Response()
            {
                Message = "Kayıt Başarılı",
                Status = true,
                RedirectUrl = Url.Action("Login", "Home")
            };
            return Json(response);
        }

        public ActionResult Login()
        {
            if (Session["LoggedUser"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(AppUserCRUDModel appUserCRUDModel)
        {
            Response response;
            AppUser appUser = appUserRepository.GetByEmailAndPassword(appUserCRUDModel.Email, appUserCRUDModel.Password);
            if (appUser != null)
            {
                if (!appUser.IsActivation)
                {
                    response = new Response()
                    {
                        Message = "Aktivasyon Yapılmadı",
                        Status = false
                    };
                }
                Session.Add("LoggedUser", appUser);
                response = new Response()
                {
                    Message = "Giriş Yapıldı",
                    Status = true,
                    RedirectUrl = Url.Action("Index", "Home")
                };
            }
            else
            {

                response = new Response()
                {
                    Message = "Kullanıcı Bulunamadı",
                    Status = false
                };
            }
            return Json(response);
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
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