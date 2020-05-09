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
        public ProductController()
        {
            productRepository = new ProductRepository();
        }
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult IndexProductStoreWindow()
        {

            List<ProductStoreWindowModel> productStoreWindowsList = new List<ProductStoreWindowModel>();
            List<Product> productList = productRepository.GetAll();
            foreach (Product product in productList)
            {
                ProductStoreWindowModel productStoreWindowModel = new ProductStoreWindowModel()
                {
                    CreateDate = product.CreateDate,
                    ProductId = product.ProductId,
                    Amount = product.Amount,
                    Explanation = product.Explanation,
                    ProductName = product.Name,
                };
                if(product.ProductMapImage != null)
                {
                    ProductMapImage procImage = product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (procImage != null)
                    {
                        productStoreWindowModel.ImagePath = procImage.ImagePath;
                    }
                    else
                    {
                        productStoreWindowModel.ImagePath = "notImage.jpg";
                    }
                }
                productStoreWindowsList.Add(productStoreWindowModel);
            }
            return View(productStoreWindowsList);

            //List<ProductStoreWindowModel> productStoreWindows = new List<ProductStoreWindowModel>();
            //List<ProductStoreWindow> productStoreWindowList = productRepository.GetAllProductStoreWindow();
            //foreach (ProductStoreWindow productStore in productStoreWindowList)
            //{
            //    ProductStoreWindowModel productStoreWindowModel = new ProductStoreWindowModel()
            //    {
            //        CreateDate = productStore.Product.CreateDate,
            //        ProductId = productStore.Product.ProductId,
            //        Amount = productStore.Product.Amount,
            //        Explanation = productStore.Product.Explanation,
            //        ProductName = productStore.Product.ShortName
            //    };
            //    if (productStore.Product.ProductMapImage != null)
            //    {
            //        ProductMapImage procImage = productStore.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
            //        if (procImage != null)
            //        {
            //            productStoreWindowModel.ImagePath = procImage.ImagePath;
            //        }
            //        else
            //        {
            //            productStoreWindowModel.ImagePath = "notImage.jpg";
            //        }
            //    }
            //    productStoreWindows.Add(productStoreWindowModel);
            //}
            //return View(productStoreWindows);
        }


        #region Ürün Detay
        public ActionResult Detail(int id=0)
        {
            ProductDetailViewModel productDetailViewModel = new ProductDetailViewModel();

            Product product = productRepository.GetById(id);

            if (product == null)
            {
                return RedirectToAction("Index", "Home");
            }

            productDetailViewModel.ProductName = product.Name;
            productDetailViewModel.ProductId = product.ProductId;
            productDetailViewModel.ShortName = product.ShortName;
            productDetailViewModel.Explanation = product.Explanation;
            productDetailViewModel.Amount = product.Amount;
            //productDetailViewModel.DiscountAmount = CalculatorHelper

            return View();
        }

        #endregion
    }
}