using ECommerce.DATA;
using ECommerce.WEB.Models.AppUserManagement;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.AppUserManagement
{ 
    [LoggedUser]
    public class AppUserController : Controller
    {
       
        // GET: AppUser
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult UserProfile()
        {
            
            return View();
        }
        public PartialViewResult _ProfileInfo()
        {
            return PartialView();
        }
    }
}