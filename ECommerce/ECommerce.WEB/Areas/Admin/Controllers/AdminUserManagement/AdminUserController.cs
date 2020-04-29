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

namespace ECommerce.WEB.Areas.Admin.Controllers.AdminUserManagement
{
    [LoggedAdmin]
    public class AdminUserController : BaseController
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
                AdminUserId = m.AdminUserId,
            }).ToList();

            return View(adminUserList);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            AdminUserCRUDModel adminUserCRUDModel = new AdminUserCRUDModel();
            return View(adminUserCRUDModel);
        }

        [HttpPost]
        public ActionResult Insert(AdminUserCRUDModel adminUserCRUDModel)
        {
            Response response;
            bool isHaveEmail = adminUserRepository.IsUseEmailAddress(adminUserCRUDModel.Email);

            if (!isHaveEmail)
            {
                string activationKey = Guid.NewGuid().ToString();
                AdminUser adminUser = new AdminUser()
                {
                    Email = adminUserCRUDModel.Email,
                    CreateDate = DateTime.Now,
                    IsActive = true,
                    IsDeleted = false,
                    Password = adminUserCRUDModel.Password
                };

                adminUserRepository.Insert(adminUser);
                response = new Response()
                {
                    Message = "Kayıt Başarılı",
                    Status = true,
                    RedirectUrl = Url.Action("Index", "AdminUser")
                };

            }
            else
            {
                response = new Response()
                {
                    Message = "Bu Mail Adresi Kullanımda",
                    Status = false,
                };
            }
            return Json(response);
        }

        [HttpGet]
        public ActionResult Update(int id = 0)
        {
            AdminUserCRUDModel adminUserCRUDModel = new AdminUserCRUDModel();
            AdminUser adminUser = adminUserRepository.GetById(id);

            if (adminUser != null)
            {
                adminUserCRUDModel.Email = adminUser.Email;
                adminUserCRUDModel.AdminUserId = adminUser.AdminUserId;
                adminUserCRUDModel.Password = adminUser.Password;
                return View(adminUserCRUDModel);
            }
            else
            {
                return RedirectToAction("Index", "AdminUser");
            }
        }

        [HttpPost]
        public ActionResult Update(AdminUserCRUDModel adminUserCRUDModel)
        {
            Response response;
            AdminUser adminUser = adminUserRepository.GetById(adminUserCRUDModel.AdminUserId);
            if (adminUser != null)
            {
                AdminUser adminUserEmail = adminUserRepository.GetByEmail(adminUserCRUDModel.Email);

                if (adminUserEmail == null)
                {
                    ///email adresi daha kullanılmamışsa buraya düşer
                    adminUser.Email = adminUserCRUDModel.Email;
                    adminUser.Password = adminUserCRUDModel.Password;
                    adminUserRepository.Update(adminUser);
                }
                else
                {
                    //Daha önce kullanımlış
                    if (adminUser.Email == adminUserEmail.Email)
                    {
                        //Email adresinde değişiklik yapılmamışsa buraya düşer aynı mail adresi ise sorun çıkarmayacak
                        adminUser.Email = adminUserCRUDModel.Email;
                        adminUser.Password = adminUserCRUDModel.Password;
                        adminUserRepository.Update(adminUser);
                    }
                    else
                    {
                        //sistemdeki email adresleri ile uyuşuyorsa hata ver
                        response = new Response()
                        {
                            Message = "Yazmış olduğunuz mail adresi bir başka kullanıcı tarafından kullanılmaktadır. ",
                            Status = false
                        };
                        return Json(response);
                    }
                }
                response = new Response()
                {
                    Message = "Kayıt Güncellendi",
                    Status = true,
                    RedirectUrl = Url.Action("Index", "AdminUser")
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Kayıt bulunamadı",
                    Status = false
                };
            }
            return Json(response);
        }

        [HttpGet]
        public ActionResult Delete(int id = 0)
        {
            AdminUser adminUser = adminUserRepository.GetById(id);
            if (adminUser != null)
            {
                adminUser.IsActive = false;
                adminUser.IsDeleted = true;
                adminUserRepository.Update(adminUser);

            }
            return RedirectToAction("Index", "AdminUser");
        }
    }
}