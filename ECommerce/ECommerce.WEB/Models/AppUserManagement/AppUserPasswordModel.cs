using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.AppUserManagement
{
    public class AppUserPasswordModel
    {
        public int AppUserId { get; set; }

        [DisplayName("Şifre")]
        [Required]
        public string Password { get; set; }


        [DisplayName("Şifre Tekrar")]
        [Required]
        public string RePassword { get; set; }

        public string ActivationCode { get; set; }
    }
}