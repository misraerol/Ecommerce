using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ProductManagement
{
    public class ProductListView
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public decimal Amount { get; set; }

        public decimal DiscountRate { get; set; }

        public string CategoryName { get; set; }

        public string ImagePath { get; set; }
    }
}