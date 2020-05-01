using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.DiscountKeyManagement
{
    public class DiscountKeyCRUDModel
    {
        [DisplayName("Kupon Adeti")]
        [Required]
        public int Count { get; set; }

        [DisplayName("Kupon Oranı")]
        [Required]
        public decimal? Discount { get; set; }

        [DisplayName("Bitiş Tarihi")]
        public DateTime? ExpiredDate { get; set; }

        public int DiscountKeyId { get; set; }

        public string GuidKey { get; set; }
    }
}