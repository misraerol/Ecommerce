﻿using ECommerce.WEB.Models.AppUserManagement;
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
using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.WEB.Areas.Admin.Model.CategoryManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.BIZ.Repository.UserCartManagament;

namespace ECommerce.WEB.Controllers
{
    public class HomeController : BaseController
    {
        SliderRepository sliderRepository;
        AppUserRepository appUserRepository;
        CategoryRepository categoryRepository;
        ParameterRepository parameterRepository;
        UserCartRepository userCartRepository;
        public HomeController()
        {
            sliderRepository = new SliderRepository();
            appUserRepository = new AppUserRepository();
            categoryRepository = new CategoryRepository();
            parameterRepository = new ParameterRepository();
            userCartRepository = new UserCartRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            appUserCRUDModel.BirthDate = DateTime.Now.AddYears(-20);
            appUserCRUDModel.ParameterGenderTypeList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.GenderType).Select(s => new CustomSelectList()
            {
                Id = s.ParameterId,
                Name = s.Name
            }).ToList();
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
            if (appUserCRUDModel.Password != appUserCRUDModel.RePassword)
            {
                response = new Response()
                {
                    Message = "Şifreler eşleşmedi",
                    Status = false
                };
            }

            string activationKey = Guid.NewGuid().ToString();

            AppUser appUser = new AppUser()
            {
                Password = appUserCRUDModel.Password,
                Email = appUserCRUDModel.Email,
                BirthDate = appUserCRUDModel.BirthDate,
                CreateDate = DateTime.Now,
                FirstName = appUserCRUDModel.FirstName,
                LastName = appUserCRUDModel.LastName,
                IsWantNotification = appUserCRUDModel.IsWantNotification,
                IsActivation = false,
                IsActive = true,
                IsDeleted = false,
                ActivationCode = activationKey,
                ParameterGenderId = appUserCRUDModel.ParameterGenderId,
            };
            appUserRepository.Insert(appUser);


            #region Mail
            MailExtension mailExtension = MailExtension.Instance();

            mailExtension.Send(appUserCRUDModel.Email, "Aktivasyon Maili", "DefaultMailTemplate", new DefaultMailTemplate()
            {
                CustomerName = StringHelper.Combine(' ', appUser.FirstName, appUser.LastName),
                RedirectUrl = Url.Action("Activation", "Home", new { activationCode = activationKey }),
                Message = "Üyelik işlemini tamamlamanız için aktivasyon yapmanız gerekmektedir."
            });

            #endregion Mail

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
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            AppUser appUser = (AppUser)Session["LoggedUser"];
            if (appUser != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View(appUserCRUDModel);
            }

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
                if (appUserCRUDModel.RememberMe)
                {
                    HttpCookie cookie = new HttpCookie("AppUser");
                    cookie["email"] = appUserCRUDModel.Email;
                    cookie["password"] = appUserCRUDModel.Password;
                    cookie.Expires = DateTime.Now.AddYears(1);

                    Response.Cookies.Add(cookie);
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

            HttpCookie cookie = Request.Cookies["AppUser"];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                cookie.Values["email"] = string.Empty;
                cookie.Values["password"] = string.Empty;
                Response.Cookies.Add(cookie);

            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Activation(string activationCode)
        {
            bool status = false;

            if (!string.IsNullOrEmpty(activationCode))
            {
                AppUser appUser = appUserRepository.GetByActivationCode(activationCode);

                if (appUser != null)
                {
                    appUser.IsActivation = true;

                    appUserRepository.Update(appUser);

                    status = true;

                    Session.Add("LoggedUser", appUser);
                }
            }
            return View(status);
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

        public PartialViewResult _UserInformation()
        {
            UserInformationModel userInformationModel = new UserInformationModel();
            //count yazılacak
            AppUser appUser = (AppUser)Session["LoggedUser"];
            if (appUser != null)
            {
                if (userInformationModel.UserCartCount != null)
                {
                    userInformationModel.UserCartCount = userCartRepository.TotalProductCount();
                    return PartialView(userInformationModel);
                }
                else
                {
                    userInformationModel.UserCartCount = 0;
                    return PartialView(userInformationModel);
                }
            }
            else
            {
                userInformationModel.UserCartCount = 0;
                return PartialView(userInformationModel);
            }
        }

        public PartialViewResult _Category()
        {
            List<CategoryListView> categoryList = categoryRepository.GetAllMainCategory().Select(a => new CategoryListView()
            {
                CategoryId = a.CategoryId,
                Name = a.Name,
                TopCategoryId = a.TopCategoryId
            }).ToList();

            return PartialView(categoryList);
        }


        public ActionResult GetAllCategory()
        {

            List<CategoryListView> categoryList = categoryRepository.GetAllMainCategory().Select(a => new CategoryListView()
            {
                CategoryId = a.CategoryId,
                Name = a.Name,
                TopCategoryId = a.TopCategoryId
            }).ToList();

            Response<List<CategoryListView>> response = new Response<List<CategoryListView>>()
            {
                Data = categoryList,
                Message = "Başarılı",
                Status = true
            };
            return Json(response);
        }

        public ActionResult GetParentCategory(int id = 0)
        {
            List<CategoryListView> categoryList = categoryRepository.GetAllByTopCategoryId(id).Select(a => new CategoryListView()
            {
                CategoryId = a.CategoryId,
                Name = a.Name,
                TopCategoryId = a.TopCategoryId
            }).ToList();

            Response<List<CategoryListView>> response = new Response<List<CategoryListView>>()
            {
                Data = categoryList,
                Message = "Başarılı",
                Status = true
            };

            return Json(response);
        }

        [HttpGet]
        public ActionResult Password()
        {
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            return View(appUserCRUDModel);
        }
        [HttpPost]
        public ActionResult Password(AppUserCRUDModel appUserCRUDModel)
        {
            Response response;
            bool anyUserEmail = appUserRepository.AnyUserEmail(appUserCRUDModel.Email);
            if (anyUserEmail)
            {
                string activationKey = Guid.NewGuid().ToString();
                AppUser appUser = appUserRepository.GetByEmail(appUserCRUDModel.Email);
                appUser.ActivationCode = activationKey;
                appUserRepository.Update(appUser);

                #region Mail
                MailExtension mailExtension = MailExtension.Instance();
                mailExtension.Send(appUserCRUDModel.Email, "Şifre Yenileme Talebi", "DefaultMailTemplate", new DefaultMailTemplate()
                {
                    CustomerName = StringHelper.Combine(' ', appUser.FirstName, appUser.LastName),
                    RedirectUrl = Url.Action("RePassword", "Home", new { activationCode = activationKey }),
                    Message = "Eğer şifre yenileme talebinin size ait olmadığını düşünüyorsanız lütfen bu e-postayı dikkate almayın. " +
                    "Mevcut şifreniz ile giriş yapmaya devam edebilirsiniz."

                });
                #endregion Mail
                response = new Response()
                {
                    Message = "Şifre değiştirme linki mailinize başarıyla gönderildi.",
                    RedirectUrl = Url.Action("Login", "Home"),
                    Status = true
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Lütfen e-posta adresinizi kontrol edin veya yeni üye kaydınızı gerçekleştirin.",
                    Status = false,
                };
            }
            return Json(response);
        }


        [HttpGet]
        public ActionResult RePassword(string activationCode)
        {
            AppUser appUser = appUserRepository.GetByActivation(activationCode);
            AppUser appUserse = appUserRepository.GetById(appUser.AppUserId);

            if (appUserse != null)
            {
                AppUserPasswordModel appUserPasswordModel = new AppUserPasswordModel();

                appUserPasswordModel.AppUserId = appUserse.AppUserId;
                appUserPasswordModel.Password = appUserse.Password;
                return View(appUserPasswordModel);
            }

            return RedirectToAction("Index", "Home");

        }

        [HttpPost]
        public ActionResult RePassword(AppUserPasswordModel appUserPasswordModel)
        {
            Response response;
            AppUser appUser = appUserRepository.GetById(appUserPasswordModel.AppUserId);
            if (appUserPasswordModel.Password != appUserPasswordModel.RePassword)
            {
                response = new Response()
                {
                    Message = "Şifreler eşleşmedi",
                    Status = false
                };
                return Json(response);
            }

            appUser.Password = appUserPasswordModel.Password;
            string activationKey = Guid.NewGuid().ToString();
            appUser.ActivationCode = activationKey;
            appUserRepository.Update(appUser);

            response = new Response()
            {
                Message = "Şifre Yenilendi",
                Status = true,
                RedirectUrl = Url.Action("Login", "Home")
            };
            return Json(response);
        }

    }
}