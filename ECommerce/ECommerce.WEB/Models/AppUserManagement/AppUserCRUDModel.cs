﻿using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WEB.Models.AppUserManagement
{
    public class AppUserCRUDModel
    {
        public int AppUserId { get; set; }

        [DisplayName("E-posta")]
        [Required]
        public string Email { get; set; }

        [DisplayName("Adı")]
        [Required]
        public string FirstName { get; set; }

        [DisplayName("Soyadı")]
        [Required]
        public string LastName { get; set; }

        [DisplayName("Şifre")]
        [Required]
        public string Password { get; set; }

        [DisplayName("Şifre Tekrar")]
        [Required]
        public string RePassword { get; set; }

        [DisplayName("Doğum Tarihi")]
        [Required]
        public DateTime BirthDate { get; set; }

        [DisplayName("Kampanya ve duyurulardan haberdar olmak istiyorum")]
        [Required]
        public bool IsWantNotification { get; set; }

        [DisplayName("Cinsiyet")]
        [Required]
        public int ParameterGenderId { get; set; }

        public List<CustomSelectList> ParameterGenderTypeList { get; set; }

        [DisplayName("Beni Hatırla")]
    
        public bool RememberMe { get; set; }
    }
}
