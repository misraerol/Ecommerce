﻿using ECommerce.BIZ.Repository.AppUserManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.DATA;
using ECommerce.WEB.Models.AppUserManagement;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System.Linq;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.AppUserManagement
{
    [LoggedUser]
    public class AppUserController : Controller
    {
        AppUserRepository appUserRepository;
        ParameterRepository parameterRepository;

        public AppUserController()
        {
            appUserRepository = new AppUserRepository();
            parameterRepository = new ParameterRepository();

        }
        // GET: AppUser
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult UpdateUser(int id = 0)
        {
            AppUserUpdateView appUserUpdateView = new AppUserUpdateView();
            AppUser appUser = appUserRepository.GetById(id);
            if (appUser != null)
            {
                appUserUpdateView.FirstName = appUser.FirstName;
                appUserUpdateView.LastName = appUser.LastName;
                appUserUpdateView.Email = appUser.Email;
                appUserUpdateView.BirthDate = appUser.BirthDate;
                appUserUpdateView.Password = appUser.Password;
                appUserUpdateView.ParameterGenderTypeList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.GenderType).Select(s => new CustomSelectList()
                {
                    Id = s.ParameterId,
                    Name = s.Name
                }).ToList();
            }
            return View(appUserUpdateView);
        }
        [HttpPost]
        public ActionResult UpdateUser(AppUserUpdateView appUserUpdateView)
        {
            Response response;
            AppUser appUser = appUserRepository.GetById(appUserUpdateView.AppUserId);
            appUser.FirstName = appUserUpdateView.FirstName;
            appUser.LastName = appUserUpdateView.LastName;
            appUser.Email = appUserUpdateView.Email;
            appUser.BirthDate = appUserUpdateView.BirthDate;
            appUser.ParameterGenderId = appUserUpdateView.ParameterGenderId;
            if (appUserUpdateView.NewPassword != appUserUpdateView.NewRePassword)
            {
                response = new Response()
                {
                    Message = "Şifreler eşleşmedi",
                    Status = false
                };
            }
            appUser.Password = appUserUpdateView.NewPassword;
            appUserRepository.Update(appUser);
            response = new Response()
            {
                Message = "Hesap güncellendi",
                RedirectUrl = Url.Action("UpdateUser", "AppUser"),
                Status = true
            };
            return Json(response);
        }
        public ActionResult UserProfile()
        {

            return View();
        }
        public PartialViewResult _ProfileInfo()
        {
            return PartialView();
        }
        public PartialViewResult _MenuInfo()
        {
            return PartialView();
        }

    }
}