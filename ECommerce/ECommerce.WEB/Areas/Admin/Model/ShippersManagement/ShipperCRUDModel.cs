using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ShippersManagement
{
    public class ShipperCRUDModel
    {
        [DisplayName("İsim")]
        public string Name{ get; set; }

        [DisplayName("Resim")]
        public HttpPostedFileBase ImagePath { get; set; }

        public int ShipperId { get; set; }
    }
}