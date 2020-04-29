using ECommerce.WEB.Areas.Admin.Model.ProductManagement;
using ECommerce.WEB.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.ProductManagement
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Insert()
        {
            ProductCRUDModel productCRUDModel = new ProductCRUDModel();

            return View(productCRUDModel);
        }
    }
}