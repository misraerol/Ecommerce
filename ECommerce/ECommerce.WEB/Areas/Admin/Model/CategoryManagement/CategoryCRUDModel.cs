using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Model.CategoryManagement
{
    public class CategoryCRUDModel
    {
        public int CategoryId { get; set; }

        [DisplayName("Kategori Adı")]
        public string CategoryName { get; set; }

        [DisplayName("Üst Kategorisi")]
        public int? TopCategoryId { get; set; }

        public SelectList TopCategoryList { get; set; }

    }
}