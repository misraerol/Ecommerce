using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Model.ProductManagement
{
    public class ProductStoreWindowCRUDModel
    {
        public int ProductStorewindowId { get; set; }

        public List<int> ProductListId { get; set; }

        public MultiSelectList ProductList { get; set; }

        public DateTime? ExpiredDate { get; set; }

    }
}