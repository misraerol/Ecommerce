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
            Product product = new Product();
            ProductMapImage procImage = product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();

            List<ProductStoreWindowModel> productStoreWindowsList = productRepository.GetAllProductStoreWindow().Select(s => new ProductStoreWindowModel
            {
                CreateDate=s.CreateDate,
                ExpiredDate=s.ExpiredDate,
                ImagePath=procImage.ImagePath,
                ProductId=s.ProductId
            }).ToList();
         
            return View(productStoreWindowsList);
        }
    }
}