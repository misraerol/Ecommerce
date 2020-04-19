using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.SliderManagement
{
    public class SliderCRUDModel
    {
        public string Title{ get; set; }

        public HttpPostedFileBase ImagePath { get; set; }

        public DateTime ExpiredDate { get; set; }

        public DateTime CretaDate { get; set; }

        public string RedirectUrl { get; set; }

        public int SliderId { get; set; }
    }
}