using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ProductManagement;
using ECommerce.DATA;
using ECommerce.WEB.Models.ProductManagament;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers
{
    [LoggedUser]
    public class ProductController : BaseController
    {
        ProductRepository productRepository;
        CategoryRepository categoryRepository;
        public ProductController()
        {
            productRepository = new ProductRepository();
            categoryRepository = new CategoryRepository();
        }
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IndexProductStoreWindow()
        {

            List<ProductStoreWindowModel> productStoreWindows = new List<ProductStoreWindowModel>();
            List<ProductStoreWindow> productStoreWindowList = productRepository.GetAllProductStoreWindow();
            foreach (ProductStoreWindow productStore in productStoreWindowList)
            {
                ProductStoreWindowModel productStoreWindowModel = new ProductStoreWindowModel()
                {
                    CreateDate = productStore.Product.CreateDate,
                   ProductId = productStore.Product.ProductId,
                    Amount = productStore.Product.Amount,
                    Explanation = productStore.Product.Explanation,
                    ProductName = productStore.Product.ShortName
                };
                if (productStore.Product.ProductMapImage != null)
                {
                    ProductMapImage procImage = productStore.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (procImage != null)
                    {
                        productStoreWindowModel.ImagePath = procImage.ImagePath;
                    }
                    else
                    {
                        productStoreWindowModel.ImagePath = "notImage.jpg";
                    }
                }
                productStoreWindows.Add(productStoreWindowModel);
            }
            return View(productStoreWindows);
        }

        //public ActionResult InsertProductStoreWindow(int productId)
        //{
        //    Product product = productRepository.GetById(productId);

        //    for (int i = 0; i < 3; i++)
        //    {
        //        Category categories = categoryRepository.GetById(product.CategoryId);
        //       ProductStoreWindow productStoreWindow = new ProductStoreWindow()
        //       {
                   
        //       }
        //    }
            
        //}
    }
}