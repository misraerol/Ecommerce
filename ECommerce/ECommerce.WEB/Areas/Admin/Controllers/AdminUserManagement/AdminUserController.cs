using ECommerce.BIZ.Repository.AdminUserManagement;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.AdminUserManagement;
using ECommerce.WEB.Controllers;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.Extension;
using ECommerce.WEB.Utility.Extension.Mail.Model;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.AdminUserManagement
{
    public class AdminUserController : BaseController
    {
        AdminUserRepository adminUserRepository;

        public AdminUserController()
        {
            adminUserRepository = new AdminUserRepository();
        }

        [LoggedAdmin]
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
        [LoggedAdmin]
        [HttpGet]
        public ActionResult Insert()
        {
            AdminUserCRUDModel adminUserCRUDModel = new AdminUserCRUDModel();
            return View(adminUserCRUDModel);
        }
        [LoggedAdmin]
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
                    IsActive = false,
                    IsDeleted = false,
                    ActivationCode = activationKey,

                    Password = adminUserCRUDModel.Password
                };

                adminUserRepository.Insert(adminUser);

                #region Mail
                MailExtension mailExtension = MailExtension.Instance();
                mailExtension.Send(adminUserCRUDModel.Email, "Aktivasyon Maili", "DefaultMailTemplate", new DefaultMailTemplate()
                {
                    CustomerName = StringHelper.Combine(' ', adminUser.Email, string.Empty),
                    RedirectUrl = Url.Action("ActivationCode", "AdminUser", new { activationCode = activationKey }),
                    Message = "Üyelik işlemini tamamlamanız için aktivasyon yapmanız gerekmektedir."

                });
                #endregion Mail



                response = new Response()
                {
                    Message = "Aktivasyondan onaylandıktan sonra kayıt gerçekleşecektir.",
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
        [LoggedAdmin]
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

        [LoggedAdmin]
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
        [LoggedAdmin]
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


        public ActionResult ActivationCode(string activationCode)
        {
            bool status = false;
            if (!string.IsNullOrEmpty(activationCode))
            {
                AdminUser adminUser = adminUserRepository.GetByActivationCode(activationCode);
                if (adminUser != null)
                {

                    adminUser.IsActive = true;
                    adminUserRepository.Update(adminUser);
                    status = true;
                    Session.Add("LoggedAdmin", adminUser);
                }
            }
            return View(status);
        }

        [HttpGet]
        public ActionResult UpdatePassword()
        {
            AdminUser adminUserSession = (AdminUser)Session["LoggedAdmin"];
            AdminUserUpdatePasswordModel adminUserUpdatePasswordModel = new AdminUserUpdatePasswordModel();
            AdminUser adminUser = adminUserRepository.GetById(adminUserSession.AdminUserId);
            if (adminUser != null)
            {

                adminUserUpdatePasswordModel.AdminUserId = adminUser.AdminUserId;
                adminUserUpdatePasswordModel.Password = adminUser.Password;
                return View(adminUserUpdatePasswordModel);
            }
            else
            {
                return RedirectToAction("Index", "AdminUser");
            }

        }

        [HttpPost]
        public ActionResult UpdatePassword(AdminUserUpdatePasswordModel adminUserUpdatePasswordModel)
        {
            AdminUser adminUser = adminUserRepository.GetById(adminUserUpdatePasswordModel.AdminUserId);
            adminUser.Password = adminUserUpdatePasswordModel.Password;
            adminUserRepository.Update(adminUser);
            Response response = new Response()
            {
                Message = "Şifre Oluşturuldu",
                Status = true,
                RedirectUrl = Url.Action("Login", "Home", new { Area = "Admin" })
            };
            return Json(response);
        }

        [HttpGet]
        public ActionResult Password()
        {
            AdminUserCRUDModel adminUserCRUDModel = new AdminUserCRUDModel();
            return View(adminUserCRUDModel);
        }

        [HttpPost]
        public ActionResult Password(AdminUserCRUDModel adminUserCRUDModel)
        {
            Response response;
            bool isHaveEmail = adminUserRepository.IsUseEmailAddress(adminUserCRUDModel.Email);

            if (isHaveEmail)
            {
                string activationKey = Guid.NewGuid().ToString();
                AdminUser adminUser = adminUserRepository.GetByEmail(adminUserCRUDModel.Email);
                adminUser.ActivationCode = activationKey;
                adminUserRepository.Update(adminUser);

                #region Mail
                MailExtension mailExtension = MailExtension.Instance();
                mailExtension.Send(adminUserCRUDModel.Email, "Şifre Yenileme Talebi", "DefaultMailTemplate", new DefaultMailTemplate()
                {
                    CustomerName = StringHelper.Combine(' ', adminUser.Email, string.Empty),
                    RedirectUrl = Url.Action("RePassword", "AdminUser", new { activationCode = activationKey }),
                    Message = "Eğer şifre yenileme talebinin size ait olmadığını düşünüyorsanız lütfen bu e-postayı dikkate almayın. " +
                    "Mevcut şifreniz ile giriş yapmaya devam edebilirsiniz."

                });
                #endregion Mail
                response = new Response()
                {
                    Message = "Şifre değiştirme linki mailinize başarıyla gönderildi.",
                    RedirectUrl = Url.Action("Login", "Home",new { Area = "Admin" }),
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
            AdminUser adminUserse = adminUserRepository.GetByActivation(activationCode);
            AdminUser adminUser = adminUserRepository.GetById(adminUserse.AdminUserId);

            if (adminUser != null)
            {
                AdminUserUpdatePasswordModel adminUserUpdatePasswordModel = new AdminUserUpdatePasswordModel();

                adminUserUpdatePasswordModel.AdminUserId = adminUser.AdminUserId;
                adminUserUpdatePasswordModel.Password = adminUser.Password;
                return View(adminUserUpdatePasswordModel);
            }

            return RedirectToAction("Login", "Home", new { Area = "Admin" });

        }

        [HttpPost]
        public ActionResult RePassword(AdminUserUpdatePasswordModel adminUserUpdatePasswordModel)
        {
            Response response;
            AdminUser adminUser = adminUserRepository.GetById(adminUserUpdatePasswordModel.AdminUserId);
            if (adminUserUpdatePasswordModel.Password != adminUserUpdatePasswordModel.RePassword)
            {
                response = new Response()
                {
                    Message = "Şifreler eşleşmedi",
                    Status = false
                };
                return Json(response);
            }
        
            adminUser.Password = adminUserUpdatePasswordModel.Password;
            string activationKey = Guid.NewGuid().ToString();
            adminUser.ActivationCode = activationKey;
           
            adminUserRepository.Update(adminUser);
        

            response = new Response()
            {
                Message = "Şifre Yenilendi",
                Status = true,
                RedirectUrl = Url.Action("Login", "Home", new { Area = "Admin" })
            };
            return Json(response);
        }

    }
}