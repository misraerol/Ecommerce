using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.ProductManagament
{
    public class ProductStoreWindowModel
    {
        public int ProductId { get; set; }

        public DateTime? ExpiredDate { get; set; }

        public DateTime CreateDate { get; set; }
        public string ImagePath { get; set; }

    }
}