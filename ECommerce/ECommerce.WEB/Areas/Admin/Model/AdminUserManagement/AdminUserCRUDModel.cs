using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.AdminUserManagement
{
    public class AdminUserCRUDModel
    {
        [DisplayName("Email")]
        [Required]
        public string Email { get; set; }

        [DisplayName("Şifre")]
        [Required]
        public string Password { get; set; }

        public int AdminUserId { get; set; }
    }
}