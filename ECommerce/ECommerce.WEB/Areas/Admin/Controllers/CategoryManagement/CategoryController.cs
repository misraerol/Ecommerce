using ECommerce.BIZ.Infrastructure;
using ECommerce.BIZ.Repository.CategoryManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.CategoryManagement;
using ECommerce.WEB.Controllers;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.CategoryManagement
{
    [LoggedAdmin]
    public class CategoryController : BaseController
    {
        CategoryRepository categoryRepository;

        public CategoryController()
        {
            categoryRepository = new CategoryRepository();
        }
        // GET: Admin/Category
        public ActionResult Index()
        {
            List<CategoryListView> categoryListView = categoryRepository.GetAllCategoryList().Select(a => new CategoryListView
            {
                CategoryId = a.LastCategoryId,
                Name = a.Name
            }).ToList();
            return View(categoryListView);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            CategoryCRUDModel categoryCRUDModel = new CategoryCRUDModel();
            List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
            categoryCRUDModel.TopCategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
            return View(categoryCRUDModel);
        }

        [HttpPost]
        public ActionResult Insert(CategoryCRUDModel categoryCRUDModel)
        {
            Category category = new Category()
            {
                IsActive = true,
                IsDeleted = false,
                CreateDate = DateTime.Now,
                TopCategoryId = categoryCRUDModel.TopCategoryId == null ? 0 : categoryCRUDModel.TopCategoryId.Value,
                Name = categoryCRUDModel.CategoryName
            };


            categoryRepository.Insert(category);
            Response response = new Response()
            {
                Status = true,
                Message = "Kategori Oluşturuldu",
                RedirectUrl = Url.Action("Index", "Category")
            };
            return Json(response);
        }
        [HttpGet]
        public ActionResult Update(int id = 0)
        {
            CategoryCRUDModel categoryCRUDModel = new CategoryCRUDModel();
            Category category = categoryRepository.GetById(id);
            if (category != null)
            {
                categoryCRUDModel.CategoryId = category.CategoryId;
                categoryCRUDModel.CategoryName = category.Name;
                categoryCRUDModel.TopCategoryId = category.TopCategoryId;
                List<RecursiveCategoryList_Result> recursiveCategoryList = categoryRepository.GetAllCategoryList();
                categoryCRUDModel.TopCategoryList = new SelectList(recursiveCategoryList, "LastCategoryId", "Name");
                return View(categoryCRUDModel);
            }
            else
            {
                return RedirectToAction("Index", "Category");
            }
        }
        [HttpPost]
        public ActionResult Update(CategoryCRUDModel categoryCRUDModel)
        {
            Response response;
            Category category = categoryRepository.GetById(categoryCRUDModel.CategoryId);
            if (category != null)
            {
                category.CategoryId = categoryCRUDModel.CategoryId;
                category.Name = categoryCRUDModel.CategoryName;
                category.TopCategoryId = categoryCRUDModel.TopCategoryId == null ? 0 : categoryCRUDModel.TopCategoryId.Value;
                categoryRepository.Update(category);
                response = new Response()
                {
                    Message = "Kayıt Güncellendi",
                    RedirectUrl = Url.Action("Index", "Category"),
                    Status = true
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Güncelleme işlemi başarısız",
                    Status = false
                };
            }
            return Json(response);
        }
        public ActionResult Delete(int id)
        {
            Category category = categoryRepository.GetById(id);
            if(category != null)
            {
                category.IsActive = false;
                category.IsDeleted = true;
                categoryRepository.Update(category);
            }
            return RedirectToAction("Index", "Category");
        }
    }
}