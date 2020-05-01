using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.AdminUserManagement
{
    public class AdminUserUpdatePasswordModel
    {
        public int AdminUserId { get; set; }

        [DisplayName("Şifre")]
        [Required]
        public string Password { get; set; }


        [DisplayName("Şifre Tekrar")]
        [Required]
        public string RePassword { get; set; }

        public string ActivationCode{ get; set; }
    }
}