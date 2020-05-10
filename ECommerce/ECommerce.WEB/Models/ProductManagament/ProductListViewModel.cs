using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.ProductManagament
{
    public class ProductListViewModel
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public decimal Amount { get; set; }

        public decimal DiscountRate { get; set; }

        public string CategoryName { get; set; }

        public string ImagePath { get; set; }
        public string Explanation { get; set; }
    }
}