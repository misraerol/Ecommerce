using ECommerce.BIZ.Repository.AdminUserManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.AdminUserManagement;
using ECommerce.WEB.Controllers;
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
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            AdminUserLoginCRUDModel adminUserLoginCRUDModel = new AdminUserLoginCRUDModel();
            return View(adminUserLoginCRUDModel);
        }

        [HttpPost]
        public ActionResult Login(AdminUserLoginCRUDModel adminUserLoginCRUDModel)
        {
            Response response;
            AdminUser adminUser = adminUserRepository.GetByEmailAndPassword(adminUserLoginCRUDModel.Email, adminUserLoginCRUDModel.Password);
            if(adminUser != null)
            {
                Session.Add("LoggedAdmin", adminUser);

                response = new Response()
                {
                    Message="Giriş Yapıldı",
                    RedirectUrl=Url.Action("Index","Home",new {Area="Admin" }),
                    Status=true
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


    }
}