using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.AppUserManagement
{
    public class AppUserUpdateView
    {
        public int AppUserId { get; set; }

        [DisplayName("Email")]
        public string Email { get; set; }

        [DisplayName("Adı")]
        public string FirstName { get; set; }

        [DisplayName("Soyadı")]
        public string LastName { get; set; }


        [DisplayName("Eski Şifre")]
        public string Password { get; set; }


        [DisplayName("Yeni Şifre")]
        public string NewPassword { get; set; }


        [DisplayName("Yeni Şifre Tekrar")]
        public string NewRePassword { get; set; }

        [DisplayName("Doğum Tarihi")]
        public DateTime BirthDate { get; set; }


        [DisplayName("Cinsiyet")]
        public int ParameterGenderId { get; set; }


        public List<CustomSelectList> ParameterGenderTypeList { get; set; }
    }
}