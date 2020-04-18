using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ShippersManagement
{
    public class ShipperCRUDModel
    {
        public string Name{ get; set; }

        public HttpPostedFileBase ImagePath { get; set; }

        public int ShipperId { get; set; }
    }
}