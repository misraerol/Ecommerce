using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ProductManagement;
using ECommerce.CORE.Helper;
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


        #region Ürün Detay
        public ActionResult Detail(int id = 0)
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
            productDetailViewModel.DiscountRate = product.DiscountRate;
            productDetailViewModel.DiscountAmount = CalculateHelper.CalculateDiscountAmount(product.DiscountRate, product.Amount);
            productDetailViewModel.CategoryName = product.Category.Name;


            #region Ürün Resimler

            if (product.ProductMapImage != null)
            {
                productDetailViewModel.ProductImageList = new List<string>();

                foreach (ProductMapImage productMapImage in product.ProductMapImage.Where(a => a.IsActive && !a.IsDeleted))
                {
                    productDetailViewModel.ProductImageList.Add(productMapImage.ImagePath);
                }
            }
            #endregion

            #region Ürün Propertyleri

            if (product.ProductMapProperty != null)
            {
                productDetailViewModel.ProductPropertyModel = new List<ProductPropertyModel>();

                foreach (ProductMapProperty productMapProperty in product.ProductMapProperty.Where(a => a.IsActive && !a.IsDeleted))
                {
                    ProductPropertyModel productPropertyModel = new ProductPropertyModel()
                    {
                        PropertyName = productMapProperty.Parameter.Name,
                        Value = productMapProperty.PropetyKey
                    };
                    productDetailViewModel.ProductPropertyModel.Add(productPropertyModel);
                }
            }

            #endregion

            #region Ürün Yorumları

            if (product.ProductMapComment != null)
            {
                productDetailViewModel.ProductMapCommentModel = new List<ProductMapCommentModel>();

                foreach (ProductMapComment productMapComment in product.ProductMapComment)
                {
                    ProductMapCommentModel productMapCommentModel = new ProductMapCommentModel()
                    {
                        AppUserName = productMapComment.AppUser.FirstName + " " + productMapComment.AppUser.LastName,
                        Comment = productMapComment.Comment,
                        ProductMapCommentId = productMapComment.ProductMapCommentId,
                        Star = productMapComment.Star
                    };
                    productDetailViewModel.ProductMapCommentModel.Add(productMapCommentModel);
                }

            }

            #endregion

            #region Ürün RequiredFiel

            productDetailViewModel.ProductMapRequiredFieldModel = new List<ProductMapRequiredFieldModel>();

            foreach (ProductMapRequiredFields requiredFields in product.ProductMapRequiredFields.Where(a => a.IsActive && !a.IsDeleted))
            {
                ProductMapRequiredFieldModel productMapRequiredFieldModel = new ProductMapRequiredFieldModel()
                {
                    Field = requiredFields.Parameter.Name,
                    ProductMapRequiredFieldId = requiredFields.ParameterId
                };
                productDetailViewModel.ProductMapRequiredFieldModel.Add(productMapRequiredFieldModel);

            }
            #endregion

            return View(productDetailViewModel);
        }

        #endregion

        public PartialViewResult _Product()
        {
            List<Product> productList = new List<Product>();
            List<ProductStoreWindow> productStoreWindowList = productRepository.GetProductStoreeManyRequestCount(20);

            foreach (ProductStoreWindow product in productStoreWindowList)
            {
                productList.Add(product.Product);
            }
            if (productList.Count < 20)
            {
                int remaining = 20 - productList.Count;
                List<int> productListId = productList.Select(a => a.ProductId).ToList();
                List<Product> increaseProductList = productRepository.GetProductManyRequestCountAndDecreaseProductList(remaining, productListId);

                foreach (Product product in increaseProductList)
                {
                    productList.Add(product);
                }

            }
            List<ProductListViewModel> productListViewModelList = new List<ProductListViewModel>();
            foreach (Product proc in productList)
            {
                ProductListViewModel productListViewModel = new ProductListViewModel()
                {
                    ProductId = proc.ProductId,
                    Amount = proc.Amount,
                    CategoryName = proc.Category.Name,
                    DiscountRate = proc.DiscountRate,
                    ProductName = proc.ShortName
                };

                if (proc.ProductMapImage != null)
                {
                    ProductMapImage procImage = proc.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (procImage != null)
                    {
                        productListViewModel.ImagePath = procImage.ImagePath;
                    }
                    else
                    {
                        productListViewModel.ImagePath = "notImage.jpg";
                    }
                }

                productListViewModel.ProductMapRequiredFieldModel = new List<ProductMapRequiredFieldModel>();
                if (proc.ProductMapRequiredFields.Where(s => s.IsActive && !s.IsDeleted).Any())
                {
                    foreach (ProductMapRequiredFields productMapRequired in proc.ProductMapRequiredFields.Where(s => s.IsActive && !s.IsDeleted))
                    {
                        ProductMapRequiredFieldModel productMapRequiredFieldModel = new ProductMapRequiredFieldModel()
                        {
                            Field = productMapRequired.Parameter.Name,
                            ProductMapRequiredFieldId = productMapRequired.Parameter.ParameterId
                        };
                        productListViewModel.ProductMapRequiredFieldModel.Add(productMapRequiredFieldModel);
                    }
                }

                productListViewModelList.Add(productListViewModel);
            }

            return PartialView(productListViewModelList);
        }

        [HttpPost]
        public ActionResult Search(string search)
        {
            List<Product> products = productRepository.GetByProductName(search);
            List<ProductListViewModel> productListViewModels = new List<ProductListViewModel>();
            foreach (Product product in products)
            {
                ProductListViewModel productListViewModel = new ProductListViewModel()
                {
                    ProductId = product.ProductId,
                    Amount = product.Amount,
                    CategoryName = product.Category.Name,
                    DiscountRate = product.DiscountRate,
                    ProductName = product.Name,
                };
                if (product.ProductMapImage != null)
                {
                    ProductMapImage productMapImage = product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (productMapImage != null)
                    {
                        productListViewModel.ImagePath = productMapImage.ImagePath;
                    }
                    else
                    {
                        productListViewModel.ImagePath = "notImage.jpg";
                    }
                }
                productListViewModel.ProductMapRequiredFieldModel = new List<ProductMapRequiredFieldModel>();
                if (product.ProductMapRequiredFields.Where(s => s.IsActive && !s.IsDeleted).Any())
                {
                    foreach (ProductMapRequiredFields productMapRequired in product.ProductMapRequiredFields.Where(s => s.IsActive && !s.IsDeleted))
                    {
                        ProductMapRequiredFieldModel productMapRequiredFieldModel = new ProductMapRequiredFieldModel()
                        {
                            Field = productMapRequired.Parameter.Name,
                            ProductMapRequiredFieldId = productMapRequired.Parameter.ParameterId
                        };
                        productListViewModel.ProductMapRequiredFieldModel.Add(productMapRequiredFieldModel);
                    }
                }
                productListViewModels.Add(productListViewModel);
            }
            return View(productListViewModels);
        }

    }
}