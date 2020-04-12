using ECommerce.BIZ.Repository.AdminUserManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.AdminUserManagement;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.AdminUserManagement
{
    [LoggedAdmin]
    public class AdminUserController : Controller
    {
        AdminUserRepository adminUserRepository;

        public AdminUserController()
        {
            adminUserRepository = new AdminUserRepository();
        }


        public ActionResult Index()
        {

            List<AdminUserListViewModel> adminUserList = adminUserRepository.GetAll().Select(m => new AdminUserListViewModel()
            {
                CreateDate = m.CreateDate,
                Email = m.Email,
                AdminUserId=m.AdminUserId,
            }).ToList();

            return View(adminUserList);
        }

    }
}