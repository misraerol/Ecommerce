using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Models.AddressManagament
{
    public class AddressCRUDModel
    {
        [DisplayName("Adres Adı")]
        [Required]
        public string Title { get; set; }

        [DisplayName("Telefon")]
        [Required]
        public string Phone { get; set; }

        [DisplayName("Ad-Soyad")]
        [Required]
        public string NameSurname { get; set; }

        [DisplayName("Adres")]
        [Required]
        public string Explanation { get; set; }

        [DisplayName("İlçe")]
        [Required]
        public int CountyId { get; set; }

        [DisplayName("Şehir")]
        [Required]
        public int CityId { get; set; }

        public DateTime CreateDate { get; set; }

        public int AddressId { get; set; }

        public SelectList CityList { get; set; }

        public SelectList CountyList { get; set; }
    }
}