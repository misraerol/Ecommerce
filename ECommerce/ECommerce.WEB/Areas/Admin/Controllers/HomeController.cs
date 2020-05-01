using ECommerce.BIZ.Repository.AdminUserManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.AdminUserManagement;
using ECommerce.WEB.Controllers;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        AdminUserRepository adminUserRepository;
        public HomeController()
        {
            adminUserRepository = new AdminUserRepository();
        }

        [LoggedAdmin]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            AdminUserLoginCRUDModel adminUserLoginCRUDModel = new AdminUserLoginCRUDModel();
            AdminUser adminUser = (AdminUser)Session["LoggedAdmin"];
            if(adminUser != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View(adminUserLoginCRUDModel);
            }
        }

        [HttpPost]
        public ActionResult Login(AdminUserLoginCRUDModel adminUserLoginCRUDModel)
        {
            Response response;
            AdminUser adminUser = adminUserRepository.GetByEmailAndPassword(adminUserLoginCRUDModel.Email, adminUserLoginCRUDModel.Password);
            if (adminUser != null)
            {
                if (!adminUser.IsActive)
                {
                    response = new Response()
                    {
                        Message = "Aktivasyon Yapılmadı",
                        Status = false
                    };
                }
                if (adminUserLoginCRUDModel.IsRemember)
                {
                    HttpCookie cookie = new HttpCookie("AdminUser");
                    cookie["email"] = adminUserLoginCRUDModel.Email;
                    cookie["password"] = adminUserLoginCRUDModel.Password;
                    cookie.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(cookie);
                }
                Session.Add("LoggedAdmin", adminUser);

                response = new Response()
                {
                    Message = "Giriş Yapıldı",
                    RedirectUrl = Url.Action("Index", "Home", new { Area = "Admin" }),
                    Status = true
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Kullanıcı Adı Veya Şifre Bulunamadı",
                    Status = false
                };
            }
            return Json(response);
        }

        public ActionResult Logout()
        {
            Session.Abandon();

            HttpCookie cookie = Request.Cookies["AdminUser"];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                cookie.Values["email"] = string.Empty;
                cookie.Values["password"] = string.Empty;
                Response.Cookies.Add(cookie);

            }
            return RedirectToAction("Index", "Home", new { area = "" });
        }

        public PartialViewResult _AdminProfile()
        {
            return PartialView();
        }

    }
}