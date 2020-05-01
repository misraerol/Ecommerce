using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ProductManagement;
using ECommerce.DATA;
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
        ProductRepository productRepository;
        CategoryRepository categoryRepository;
        public ProductController()
        {
            categoryRepository = new CategoryRepository();
            productRepository = new ProductRepository();
        }
        // GET: Admin/Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Insert()
        {
            ProductCRUDModel productCRUDModel = new ProductCRUDModel();

            List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
            productCRUDModel.CategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            return View(productCRUDModel);
        }
    }
}