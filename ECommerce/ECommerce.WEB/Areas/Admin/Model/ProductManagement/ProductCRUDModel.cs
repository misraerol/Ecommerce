using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Model.ProductManagement
{
    public class ProductCRUDModel
    {
        [DisplayName("Ürün Adı")]
        public string Name { get; set; }

        [DisplayName("Ürünün Kısa Adı")]
        public string ShortName { get; set; }

        [DisplayName("Ürün Açıklaması HTML")]
        public string Explanation { get; set; }

        [DisplayName("Tutarı")]
        public decimal Amount { get; set; }

        [DisplayName("İndirim Oranı %")]
        public decimal DiscountRate { get; set; }

        [DisplayName("Kategorisi")]
        public int CategoryId { get; set; }

        [DisplayName("Kargo Firması")]
        public int ShipperId { get; set; }

        public bool IsShipperFree { get; set; }

        public decimal ShipperAmount { get; set; }

        [DisplayName("Kargo Ücreti var mı ?")]
        public bool IsShipperPay { get; set; }

        [DisplayName("Ürün Resimleri")]
        public List<HttpPostedFileBase> ProductImageList { get; set; }

        public List<ProductMapPropertyCRUDModel> ProductMapPropertyCRUDModel { get; set; }

        public SelectList CategoryList { get; set; }
        public SelectList ShipperList { get; set; }
        public SelectList PrdouctPropertyList { get; set; }
    }


    public class ProductMapPropertyCRUDModel
    {
        public int ProductMapPropertyId { get; set; }

        [DisplayName("Özellik")]
        public string Value { get; set; }
        [DisplayName("Ürün Özelliği")]
        public int PrmProductPropertyId { get; set; }
    }
}