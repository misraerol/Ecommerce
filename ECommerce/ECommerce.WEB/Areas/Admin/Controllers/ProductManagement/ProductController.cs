using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.BIZ.Repository.ProductManagement;
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

        [HttpGet]
        public ActionResult Insert()
        {
            ProductCRUDModel productCRUDModel = new ProductCRUDModel();

            List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
            productCRUDModel.CategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            productCRUDModel.ShipperList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            List<Parameter> parameterProductPropertyList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductProperty);
            productCRUDModel.ProductPropertyList = new SelectList(parameterProductPropertyList, "ParameterId", "Name");
            productCRUDModel.ProductMapPropertyCRUDModel = new List<ProductMapPropertyCRUDModel>() { new ProductMapPropertyCRUDModel() {} };
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

            Product product = new Product()
            {
                Amount=productCRUDModel.Amount,
                IsActive=true,
                IsDeleted=false,
                CategoryId=productCRUDModel.CategoryId,
                CreateDate=DateTime.Now,
                DiscountRate=productCRUDModel.DiscountRate,
                Explanation=productCRUDModel.Explanation,
                ShortName=productCRUDModel.ShortName,
                Name=productCRUDModel.Name,
            };

            if (productCRUDModel.IsShipperPay.Value==true)
            {
                product.IsShipperPay = true;
                product.ProductMapShippers = new List<ProductMapShippers>();

                ProductMapShippers productMapShippers = new ProductMapShippers()
                {
                    Amount = productCRUDModel.ShipperAmount,
                    ShipperId = productCRUDModel.ShipperId,
                    IsActive = true,
                    IsDeleted = false,
                    CreateDate=DateTime.Now,
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
                        Message="Aynı Ürün Özelliğini İki Defa Ekleyemezsiniz",
                        Status=false,
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
                        ParameterId= property.PrmProductPropertyId.Value,
                        PropetyKey=property.Value,
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
                        IsActive=true,
                        IsDeleted=false,
                        CreateDate=DateTime.Now,
                        ParameterId= filed,
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
                            IsActive=true,
                            IsDeleted=false,
                            CreateDate=DateTime.Now,
                            ImagePath=fileName
                        };
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
    }
}