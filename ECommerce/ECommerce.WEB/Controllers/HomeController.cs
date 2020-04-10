
using ECommerce.WEB.Models.AppUserManagement;
using ECommerce.CORE.Helper;
using ECommerce.WEB.Utility.Extension;
using ECommerce.WEB.Utility.Extension.Mail.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            AppUserCRUDModel appUserCRUDModel = new AppUserCRUDModel();
            return View(appUserCRUDModel);
        }
    }
}