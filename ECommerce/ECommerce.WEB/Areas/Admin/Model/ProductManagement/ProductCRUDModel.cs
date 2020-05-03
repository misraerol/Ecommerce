using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Model.ProductManagement
{
    public class ProductCRUDModel
    {
        public int ProductId { get; set; }

        [DisplayName("Ürün Adı")]
        [Required]
        public string Name { get; set; }

        [DisplayName("Ürünün Kısa Adı")]
        [Required]
        public string ShortName { get; set; }

        [DisplayName("Ürün Açıklaması HTML")]
        [Required]
        public string Explanation { get; set; }

        [DisplayName("Tutarı")]
        [Required]
        public decimal Amount { get; set; }

        [DisplayName("İndirim Oranı %")]
        public decimal DiscountRate { get; set; }

        [DisplayName("Kategorisi")]
        [Required]
        public int CategoryId { get; set; }

        #region Kargo
        [DisplayName("Kargo Firması")]
        [Required]
        public int ShipperId { get; set; }

        [DisplayName("Kargo Ücreti")]
        [Required]
        public decimal ShipperAmount { get; set; }

        [DisplayName("Kargo Ücreti var mı ?")]
        [Required]
        public bool? IsShipperPay { get; set; }

        #endregion

        [DisplayName("Ürün Beden Boy Özellik Seçimi")]
        public List<int> ProductRequiredFieldListId { get; set; }

        [DisplayName("Ürün Resimleri")]
        public List<HttpPostedFileBase> ProductImageList { get; set; }
        public List<ProductMapPropertyCRUDModel> ProductMapPropertyCRUDModel { get; set; }
        public List<ProductMapImageCRUDModel> ProductMapImageCRUDModel { get; set; }

        public SelectList CategoryList { get; set; }
        public SelectList ShipperList { get; set; }
        public SelectList ProductPropertyList { get; set; }
        public MultiSelectList ProductRequiredFieldList { get; set; }
    }


    public class ProductMapPropertyCRUDModel
    {
        public int ProductMapPropertyId { get; set; }

        [DisplayName("Özellik")]
        [Required]
        public string Value { get; set; }
        [DisplayName("Ürün Özelliği")]
        [Required]
        public int? PrmProductPropertyId { get; set; }
    }


    public class ProductMapImageCRUDModel
    {
        public int ProductMapImageId { get; set; }

        public string ImagePath { get; set; }
    }

}