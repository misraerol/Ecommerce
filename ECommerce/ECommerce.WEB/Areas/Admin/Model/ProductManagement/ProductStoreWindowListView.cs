using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ProductManagement
{
    public class ProductStoreWindowListView
    {
        public int ProductStorewindowId { get; set; }

        public string ProductName { get; set; }

        public DateTime? ExpiredDate { get; set; }

        public string ImagePath { get; set; }
    }
}