using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.ProductManagament
{
    public class ProductDetailViewModel
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public string ShortName { get; set; }

        public string Explanation { get; set; }

        public decimal Amount { get; set; }

        public decimal DiscountAmount { get; set; }

        public List<string> ProductImageList { get; set; }

        public int? ProductRequiredFieldId { get; set; }

        public List<ProductPropertyModel> ProductPropertyModel { get; set; }

        public ProductShipperModel ProductShipperModel { get; set; }


    }
 

    public class ProductPropertyModel
    {
        public int PropertyName { get; set; }

        public string Value { get; set; }
    }

    public class ProductShipperModel
    {
        public int ProductShipperName { get; set; }

        public decimal Amount { get; set; }
    }

    public class ProductMapComment
    {
        public int ProductMapCommentId { get; set; }

        public string AppUserName { get; set; }

        public byte Star { get; set; }

        public string Comment { get; set; }
    }

}