using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.AdminUserManagement
{
    public class AdminUserLoginCRUDModel
    {
        [DisplayName("E-posta")]
        [Required]
        public string Email { get; set; }
        
        [Required]
        [DisplayName("Şifre")]
        public string Password { get; set; }

        [DisplayName("Beni Hatırla")]
        public bool IsRemember { get; set; }
    }
}