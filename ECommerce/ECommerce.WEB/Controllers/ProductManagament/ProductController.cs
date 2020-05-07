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
        }
    }
}