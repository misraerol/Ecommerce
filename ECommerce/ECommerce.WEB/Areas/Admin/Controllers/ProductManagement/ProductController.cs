using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
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
        ParameterRepository parameterRepository;
        public ProductController()
        {
            categoryRepository = new CategoryRepository();
            productRepository = new ProductRepository();
            parameterRepository = new ParameterRepository();
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
            productCRUDModel.ShipperList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            List<Parameter> parameterList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductProperty);
            productCRUDModel.PrdouctPropertyList = new SelectList(parameterList, "ParameterId", "Name");
            productCRUDModel.ProductMapPropertyCRUDModel = new List<ProductMapPropertyCRUDModel>() {new ProductMapPropertyCRUDModel() };
            return View(productCRUDModel);
        }
    }
}