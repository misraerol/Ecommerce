using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.DiscountKeyManagement
{
    public class DiscountKeyListViewModel
    {
        public decimal? Discount { get; set; }

        public string GuidKey { get; set; }

        public DateTime? ExpiredDate { get; set; }

        public DateTime CretaDate { get; set; }

        public int DiscountKeyId { get; set; }
    }
}