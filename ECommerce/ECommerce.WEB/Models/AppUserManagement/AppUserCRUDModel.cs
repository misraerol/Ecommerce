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
        [DisplayName("Email")]
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
    }
}
