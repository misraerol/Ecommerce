using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.SliderManagement
{
    public class SliderCRUDModel
    {
        [DisplayName("Başlık")]
       
        public string Title{ get; set; }

        [DisplayName("Resim")]
      
        public HttpPostedFileBase ImagePath { get; set; }

        [DisplayName("Bitiş Tarihi")]
        public DateTime? ExpiredDate { get; set; }

        [DisplayName("Başlangıç Tarihi")]
        public DateTime CretaDate { get; set; }

        [DisplayName("Url")]
        public string RedirectUrl { get; set; }

        public int SliderId { get; set; }
    }
}