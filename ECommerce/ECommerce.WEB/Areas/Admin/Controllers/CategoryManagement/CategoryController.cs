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
            List<CategoryListView> categoryListView = categoryRepository.GetAllCategoryList().Select(a=>new CategoryListView
            {
                CategoryId=a.LastCategoryId,
                Name=a.Name
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

    }
}