using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ShippersManagement
{
    public class ShipperListView
    {
        public string Name { get; set; }

        public string ImagePath { get; set; }

        public int ShipperId { get; set; }

        public DateTime CreateDate { get; set; }
    }
}