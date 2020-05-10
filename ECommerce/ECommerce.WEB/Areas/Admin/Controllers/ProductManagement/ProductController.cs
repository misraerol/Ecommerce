using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.BIZ.Repository.ProductManagement;
using ECommerce.BIZ.Repository.ShippersManagement;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.ProductManagement;
using ECommerce.WEB.Controllers;
using ECommerce.WEB.Utility.UIFramework;
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
        ShippersRepository shippersRepository;
        public ProductController()
        {
            categoryRepository = new CategoryRepository();
            productRepository = new ProductRepository();
            parameterRepository = new ParameterRepository();
            shippersRepository = new ShippersRepository();
        }
        // GET: Admin/Product
        public ActionResult Index()
        {
            List<ProductListView> productListViewModelList = new List<ProductListView>();
            List<Product> productList = productRepository.GetAll();

            foreach (Product proc in productList)
            {
                ProductListView productListViewModel = new ProductListView()
                {
                    ProductId = proc.ProductId,
                    Amount = proc.Amount,
                    CategoryName = proc.Category.Name,
                    DiscountRate = proc.DiscountRate,
                    ProductName = proc.Name
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
                productListViewModelList.Add(productListViewModel);
            }

            return View(productListViewModelList);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            ProductCRUDModel productCRUDModel = new ProductCRUDModel();

            List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
            productCRUDModel.CategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            List<Shipper> shipperList = shippersRepository.GetAll();
            productCRUDModel.ShipperList = new SelectList(shipperList, "ShipperId", "Name");
            List<Parameter> parameterProductPropertyList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductProperty);
            productCRUDModel.ProductPropertyList = new SelectList(parameterProductPropertyList, "ParameterId", "Name");
            productCRUDModel.ProductMapPropertyCRUDModel = new List<ProductMapPropertyCRUDModel>() { new ProductMapPropertyCRUDModel() { PrmProductPropertyId = 1 } };
            List<Parameter> parameterRequiredFieldList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductRequiredTypes);
            productCRUDModel.ProductRequiredFieldList = new SelectList(parameterRequiredFieldList, "ParameterId", "Name");
            return View(productCRUDModel);
        }

        [HttpPost]
        [ValidateInput(false)]
        public JsonResult Insert(ProductCRUDModel productCRUDModel)
        {
            Response response;
            var test = Request.Form.AllKeys;

            #region Resim Kontrolü
            foreach (var item in productCRUDModel.ProductImageList)
            {
                if (item == null)
                {
                    response = new Response()
                    {
                        Message = "Ürün Resmi Alanına Resim Ekleyiniz",
                        Status = false
                    };
                    return Json(response);
                }
            }
            #endregion

            Product product = new Product()
            {
                Amount = productCRUDModel.Amount,
                IsActive = true,
                IsDeleted = false,
                CategoryId = productCRUDModel.CategoryId,
                CreateDate = DateTime.Now,
                DiscountRate = productCRUDModel.DiscountRate,
                Explanation = productCRUDModel.Explanation,
                ShortName = productCRUDModel.ShortName,
                Name = productCRUDModel.Name,
            };

            if (productCRUDModel.IsShipperPay.Value == true)
            {
                product.IsShipperPay = true;
                product.ProductMapShippers = new List<ProductMapShippers>();

                ProductMapShippers productMapShippers = new ProductMapShippers()
                {
                    Amount = productCRUDModel.ShipperAmount,
                    ShipperId = productCRUDModel.ShipperId,
                    IsActive = true,
                    IsDeleted = false,
                    CreateDate = DateTime.Now,
                };
                product.ProductMapShippers.Add(productMapShippers);
            }


            if (productCRUDModel.ProductMapPropertyCRUDModel != null)
            {
                #region Birden fazla kategori kontrolü
                List<int> propertyListId = productCRUDModel.ProductMapPropertyCRUDModel.Select(a => a.PrmProductPropertyId.Value).ToList();
                List<int> propertyListDistinct = productCRUDModel.ProductMapPropertyCRUDModel.Select(a => a.PrmProductPropertyId.Value).Distinct().ToList();

                if (propertyListDistinct.Count != propertyListId.Count())
                {
                    response = new Response()
                    {
                        Message = "Aynı Ürün Özelliğini İki Defa Ekleyemezsiniz",
                        Status = false,
                    };
                    return Json(response);
                }
                #endregion

                product.ProductMapProperty = new List<ProductMapProperty>();

                foreach (ProductMapPropertyCRUDModel property in productCRUDModel.ProductMapPropertyCRUDModel)
                {

                    ProductMapProperty productMapProperty = new ProductMapProperty()
                    {
                        IsActive = true,
                        IsDeleted = false,
                        CreateDate = DateTime.Now,
                        ParameterId = property.PrmProductPropertyId.Value,
                        PropetyKey = property.Value,
                    };
                    product.ProductMapProperty.Add(productMapProperty);
                }

            }

            if (productCRUDModel.ProductRequiredFieldListId != null)
            {
                product.ProductMapRequiredFields = new List<ProductMapRequiredFields>() { };
                foreach (int filed in productCRUDModel.ProductRequiredFieldListId)
                {
                    ProductMapRequiredFields productMapRequiredFields = new ProductMapRequiredFields()
                    {
                        IsActive = true,
                        IsDeleted = false,
                        CreateDate = DateTime.Now,
                        ParameterId = filed,
                    };
                    product.ProductMapRequiredFields.Add(productMapRequiredFields);
                }
            }

            product.ProductMapImage = new List<ProductMapImage>();
            if (productCRUDModel.ProductImageList != null)
            {
                string fileName = string.Empty;
                foreach (HttpPostedFileBase httpPostedFileBase in productCRUDModel.ProductImageList)
                {
                    fileName = string.Empty;
                    if (httpPostedFileBase != null)
                    {
                        fileName = FileHelper.GenerateFileName(httpPostedFileBase.FileName);
                        httpPostedFileBase.SaveAs(Server.MapPath("~/Uploads/ProductImage/" + fileName));

                        ProductMapImage productMapImage = new ProductMapImage()
                        {
                            IsActive = true,
                            IsDeleted = false,
                            CreateDate = DateTime.Now,
                            ImagePath = fileName
                        };
                        product.ProductMapImage.Add(productMapImage);
                    }
                }
            }

            productRepository.Insert(product);


            response = new Response()
            {
                Message = "Ürün Eklendi",
                Status = true,
                RedirectUrl = Url.Action("Index", "Product")
            };
            return Json(response);
        }

        public ActionResult Update(int id = 0)
        {

            Product product = productRepository.GetById(id);
            if (product == null)
            {
                return RedirectToAction("Index", "Product");
            }
            ProductCRUDModel productCRUDModel = new ProductCRUDModel();
            productCRUDModel.Amount = product.Amount;
            productCRUDModel.CategoryId = product.CategoryId;
            productCRUDModel.DiscountRate = product.DiscountRate;
            productCRUDModel.Explanation = product.Explanation;
            productCRUDModel.Name = product.Name;
            productCRUDModel.ShortName = product.ShortName;
            productCRUDModel.ProductId = product.ProductId;
            productCRUDModel.IsShipperPay = false;

            #region SelectList

            List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
            productCRUDModel.CategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            List<Shipper> shipperList = shippersRepository.GetAll();
            productCRUDModel.ShipperList = new SelectList(shipperList, "ShipperId", "Name");
            List<Parameter> parameterProductPropertyList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductProperty);
            productCRUDModel.ProductPropertyList = new SelectList(parameterProductPropertyList, "ParameterId", "Name");
            productCRUDModel.ProductMapPropertyCRUDModel = new List<ProductMapPropertyCRUDModel>() { new ProductMapPropertyCRUDModel() { } };
            List<Parameter> parameterRequiredFieldList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductRequiredTypes);
            productCRUDModel.ProductRequiredFieldList = new MultiSelectList(parameterRequiredFieldList, "ParameterId", "Name");
            #endregion

            #region Kargo alanlarını dolduruyor
            if (product.IsShipperPay)
            {
                if (product.ProductMapShippers != null)
                {
                    ProductMapShippers productMapShippers = product.ProductMapShippers.Where(s => s.IsActive && !s.IsDeleted).SingleOrDefault();

                    if (productMapShippers != null)
                    {
                        productCRUDModel.IsShipperPay = true;
                        productCRUDModel.ShipperId = productMapShippers.ShipperId;
                        productCRUDModel.ShipperAmount = productMapShippers.Amount;
                    }

                }
            }
            #endregion


            #region Required Fields Alanları Dolduruyor

            if (product.ProductMapRequiredFields != null)
            {
                List<ProductMapRequiredFields> productMapRequiredFieldList = product.ProductMapRequiredFields.Where(s => s.IsActive && !s.IsDeleted).ToList();

                List<int> requiredFieldsId = productMapRequiredFieldList.Select(s => s.ParameterId).ToList();
                productCRUDModel.ProductRequiredFieldList = new MultiSelectList(parameterRequiredFieldList, "ParameterId", "Name", requiredFieldsId);

            }
            #endregion

            #region Propertyleri Getiriyor

            if (product.ProductMapRequiredFields != null)
            {
                List<ProductMapProperty> productMapProperty = product.ProductMapProperty.Where(s => s.IsActive & !s.IsDeleted).ToList();

                productCRUDModel.ProductMapPropertyCRUDModel = new List<ProductMapPropertyCRUDModel>();

                foreach (ProductMapProperty requiredFields in productMapProperty)
                {
                    productCRUDModel.ProductMapPropertyCRUDModel.Add(new ProductMapPropertyCRUDModel()
                    {
                        PrmProductPropertyId = requiredFields.ParameterId,
                        ProductMapPropertyId = requiredFields.ProductMapPropertyId,
                        Value = requiredFields.PropetyKey
                    });
                }
            }

            #endregion

            #region Resimleri Getiriyor


            if (product.ProductMapImage != null)
            {
                productCRUDModel.ProductMapImageCRUDModel = new List<ProductMapImageCRUDModel>();

                productCRUDModel.ProductMapImageCRUDModel = product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Select(a => new ProductMapImageCRUDModel()
                {
                    ImagePath = a.ImagePath,
                    ProductMapImageId = a.ProductMapImageId
                }).ToList();
            }

            #endregion

            return View(productCRUDModel);
        }
        [HttpPost]
        public JsonResult Update(ProductCRUDModel productCRUDModel)
        {
            Response response;

            Product product = productRepository.GetById(productCRUDModel.ProductId);
            productCRUDModel.Amount = product.Amount;
            productCRUDModel.CategoryId = product.CategoryId;
            productCRUDModel.DiscountRate = product.DiscountRate;
            productCRUDModel.Explanation = product.Explanation;
            productCRUDModel.Name = product.Name;
            productCRUDModel.ShortName = product.ShortName;
            productCRUDModel.ProductId = product.ProductId;
            productCRUDModel.IsShipperPay = productCRUDModel.IsShipperPay;

            #region Shipper alanını kaydedip siliyor
            if (productCRUDModel.IsShipperPay.Value)
            {
                if (product.ProductMapShippers != null)
                {
                    ProductMapShippers productMapShippers = product.ProductMapShippers.Where(s => s.IsActive && !s.IsDeleted).SingleOrDefault();

                    if (productMapShippers != null)
                    {
                        productMapShippers.ShipperId = productCRUDModel.ShipperId;
                        productMapShippers.Amount = productCRUDModel.Amount;
                    }
                }
                else
                {
                    ProductMapShippers productMapShippers = new ProductMapShippers()
                    {
                        IsDeleted = false,
                        IsActive = true,
                        CreateDate = DateTime.Now,
                        Amount = productCRUDModel.Amount,
                        ShipperId = productCRUDModel.ShipperId,
                    };
                    product.ProductMapShippers = new List<ProductMapShippers>();
                    product.ProductMapShippers.Add(productMapShippers);

                }
            }
            else
            {
                ProductMapShippers productMapShippers = product.ProductMapShippers.Where(s => s.IsActive && !s.IsDeleted).SingleOrDefault();

                if (productMapShippers != null)
                {
                    productMapShippers.IsActive = false;
                    productMapShippers.IsDeleted = true;
                }
            }
            #endregion Shipper alanını kaydedip siliyor

            #region Reqiured fields alanın kaydedip siliyor
            if (product.ProductMapRequiredFields != null)
            {
                List<ProductMapRequiredFields> productMapRequiredFieldsList = product.ProductMapRequiredFields.Where(s => s.IsActive & !s.IsDeleted).ToList();

                foreach (ProductMapRequiredFields mapRequiredFields in productMapRequiredFieldsList.Where(s => !productCRUDModel.ProductRequiredFieldListId.Contains(s.ParameterId)))
                {
                    mapRequiredFields.IsActive = false;
                    mapRequiredFields.IsDeleted = true;
                }

                foreach (int item in productCRUDModel.ProductRequiredFieldListId)
                {
                    ProductMapRequiredFields mapRequiredFields = productMapRequiredFieldsList.Where(s => s.ParameterId == item).FirstOrDefault();
                    if (mapRequiredFields == null)
                    {
                        ProductMapRequiredFields productMapProperty = new ProductMapRequiredFields()
                        {
                            IsActive = true,
                            IsDeleted = false,
                            CreateDate = DateTime.Now,
                            ParameterId = item,
                        };
                        product.ProductMapRequiredFields.Add(productMapProperty);
                    }
                }


            }

            #endregion

            #region ProductMapRequiredFields Kaydedip Siliyor

            if (productCRUDModel.ProductMapPropertyCRUDModel != null)
            {

                List<int> propertyListId = productCRUDModel.ProductMapPropertyCRUDModel.Select(a => a.ProductMapPropertyId).ToList();

                foreach (ProductMapProperty productMapProperty in product.ProductMapProperty.Where(a => !propertyListId.Contains(a.ProductMapPropertyId)))
                {
                    productMapProperty.IsActive = false;
                    productMapProperty.IsDeleted = true;
                }


                foreach (ProductMapPropertyCRUDModel productMapProperty in productCRUDModel.ProductMapPropertyCRUDModel)
                {
                    if (productMapProperty.ProductMapPropertyId == 0)
                    {
                        ProductMapProperty productMap = new ProductMapProperty()
                        {
                            IsActive = true,
                            IsDeleted = false,
                            CreateDate = DateTime.Now,
                            PropetyKey = productMapProperty.Value,
                            ParameterId = productMapProperty.PrmProductPropertyId.Value,
                        };
                        product.ProductMapProperty.Add(productMap);
                    }
                    else
                    {
                        ProductMapProperty productMap = product.ProductMapProperty.Where(s => s.ProductMapPropertyId == productMapProperty.ProductMapPropertyId).SingleOrDefault();
                        if (productMap != null)
                        {
                            productMap.PropetyKey = productMapProperty.Value;
                            productMap.ParameterId = productMapProperty.PrmProductPropertyId.Value;
                        }
                    }
                }
            }
            else
            {
                if (product.ProductMapProperty != null)
                {
                    foreach (ProductMapProperty mapProperty in product.ProductMapProperty)
                    {
                        mapProperty.IsActive = false;
                        mapProperty.IsDeleted = true;
                    }

                }

            }


            #endregion

            #region Yeni Resimleri Kaydediyor

            if (productCRUDModel.ProductImageList != null)
            {
                string fileName = string.Empty;
                foreach (HttpPostedFileBase httpPostedFileBase in productCRUDModel.ProductImageList)
                {
                    fileName = string.Empty;
                    if (httpPostedFileBase != null)
                    {
                        fileName = FileHelper.GenerateFileName(httpPostedFileBase.FileName);
                        httpPostedFileBase.SaveAs(Server.MapPath("~/Uploads/ProductImage/" + fileName));

                        ProductMapImage productMapImage = new ProductMapImage()
                        {
                            IsActive = true,
                            IsDeleted = false,
                            CreateDate = DateTime.Now,
                            ImagePath = fileName
                        };
                        if (product.ProductMapImage == null)
                        {
                            product.ProductMapImage = new List<ProductMapImage>();
                        }
                        product.ProductMapImage.Add(productMapImage);
                    }
                }
            }

            #endregion

            productRepository.Update(product);
            response = new Response()
            {
                Message = "Kayıt Güncellendi",
                Status = true,
                RedirectUrl = Url.Action("Index", "Product")
            };
            return Json(response);
        }

        public ActionResult Delete(int id = 0)
        {
            Product product = productRepository.GetById(id);
            if (product == null)
            {
                return RedirectToAction("Index", "Product");
            }

            product.IsActive = false;
            product.IsDeleted = true;
            productRepository.Update(product);
            return RedirectToAction("Index", "Product");
        }

        public ActionResult DeleteImage(int id)
        {

            ProductMapImage productMapImage = productRepository.GetProductMapImageById(id);

            if (productMapImage != null)
            {
                productMapImage.IsActive = false;
                productMapImage.IsDeleted = true;
                productRepository.UpdateProductMapImage(productMapImage);
                return RedirectToAction("Update", "Product", new { id = productMapImage.ProductId });
            }
            else
            {
                return RedirectToAction("Index", "Product");

            }
        }

        #region vitrin ürünler
        public ActionResult ProductStoreWindowList()
        {
            List<ProductStoreWindowListView> productStoreWindowListView = new List<ProductStoreWindowListView>();
            List<ProductStoreWindow> productStoreWindowsList = productRepository.GetAllProductStoreWindow();
            foreach (ProductStoreWindow productStoreWindow in productStoreWindowsList)
            {
                ProductStoreWindowListView productStoreWindowListViewModel = new ProductStoreWindowListView()
                {
                    ExpiredDate = productStoreWindow.ExpiredDate,
                    ProductName = productStoreWindow.Product.ShortName,
                    ProductStorewindowId = productStoreWindow.ProductStoreWindowId
                };
                if (productStoreWindow.Product.ProductMapImage != null)
                {
                    ProductMapImage productMapImage = productStoreWindow.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (productMapImage != null)
                    {
                        productStoreWindowListViewModel.ImagePath = productMapImage.ImagePath;
                    }
                    else
                    {
                        productStoreWindowListViewModel.ImagePath = "notImage.jpg";
                    }
                }
                productStoreWindowListView.Add(productStoreWindowListViewModel);
            }

            return View(productStoreWindowListView);
        }

        public ActionResult InsertProductStoreWindow()
        {
            ProductStoreWindowCRUDModel productStoreWindow = new ProductStoreWindowCRUDModel();
            List<Product> productList = productRepository.GetAll();
            productStoreWindow.ProductList = new MultiSelectList(productList, "ProductId", "ShortName");
            return View(productStoreWindow);
        }
        [HttpPost]
        public ActionResult InsertProductStoreWindow(ProductStoreWindowCRUDModel productStoreWindowCRUDModel)
        {
            Response response;
            List<ProductStoreWindow> productStoreWindowList = new List<ProductStoreWindow>();
            foreach (int productId in productStoreWindowCRUDModel.ProductListId)
            {
                bool anyUserProductId = productRepository.AnyProductId(productId);
                if (anyUserProductId)
                {
                    Product product = productRepository.GetById(productId);
                    response = new Response()
                    {
                        Status = false,
                        Message = product.ShortName + " daha önce vitrin ürünlerine eklenmiştir.",
                    };
                    return Json(response);
                }
                ProductStoreWindow productStoreWindow = new ProductStoreWindow()
                {
                    CreateDate = DateTime.Now,
                    ExpiredDate = productStoreWindowCRUDModel.ExpiredDate,
                    ProductId = productId,
                    IsActive = true,
                    IsDeleted = false
                };
                productStoreWindowList.Add(productStoreWindow);
            }
            if (productStoreWindowList.Any())
            {
                productRepository.InsertManyProductStoreWindow(productStoreWindowList);
            }
            response = new Response()
            {
                Status = true,
                Message = "Ürün Eklendi",
                RedirectUrl = Url.Action("ProductStoreWindowList", "Product"),
            };
            return Json(response);

        }
        public ActionResult UpdateProductStoreWindow(int id)
        {
            ProductStoreWindowCRUDModel productStoreWindowCRUDModel = new ProductStoreWindowCRUDModel();
            ProductStoreWindow productStoreWindow = productRepository.GetProductStoreWindowById(id);
            List<Product> productList = productRepository.GetAll();
            productStoreWindowCRUDModel.ProductList = new MultiSelectList(productList, "ProductId", "ShortName", new List<int> { productStoreWindow.ProductId });
            productStoreWindowCRUDModel.ExpiredDate = productStoreWindow.ExpiredDate;
            productStoreWindowCRUDModel.ProductStorewindowId = productStoreWindow.ProductStoreWindowId;
            return View(productStoreWindowCRUDModel);
        }
        [HttpPost]
        public ActionResult UpdateProductStoreWindow(ProductStoreWindowCRUDModel productStoreWindowCRUDModel)
        {
            Response response;
            ProductStoreWindow productStoreWindow = productRepository.GetProductStoreWindowById(productStoreWindowCRUDModel.ProductStorewindowId);
            ProductStoreWindow anyproductStoreWindow = productRepository.GetProductStoreWindowByProductId(productStoreWindowCRUDModel.ProductId);
            if (anyproductStoreWindow != null)
            {
                if (productStoreWindow.ProductStoreWindowId != anyproductStoreWindow.ProductStoreWindowId)
                {
                    response = new Response()
                    {
                        Status = false,
                        Message = "Bu ürün daha önce vitrin ürünlerine eklenmiştir."
                    };
                    return Json(response);
                }
            }
            productStoreWindow.ProductStoreWindowId = productStoreWindowCRUDModel.ProductStorewindowId;
            productStoreWindow.ExpiredDate = productStoreWindowCRUDModel.ExpiredDate;
            productStoreWindow.ProductId = productStoreWindowCRUDModel.ProductListId.Take(1).SingleOrDefault();
            productRepository.UpdateProductStoreWindow(productStoreWindow);
            response = new Response()
            {
                Status = true,
                Message = "Ürün Eklendi",
                RedirectUrl = Url.Action("ProductStoreWindowList", "Product"),
            };
            return Json(response);
        
        }
        public ActionResult DeleteProductStoreWindow(int id = 0)
        {
            ProductStoreWindow productStoreWindow = productRepository.GetProductStoreWindowById(id);
            productStoreWindow.IsActive = false;
            productStoreWindow.IsDeleted = true;
            productRepository.UpdateProductStoreWindow(productStoreWindow);
            return RedirectToAction("ProductStoreWindowList", "Product");
        }
        #endregion

    }
}