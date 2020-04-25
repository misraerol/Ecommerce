using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.CategoryManagement
{
    public class CategoryRepository : IRepository<Category>
    {

        ECommerceEntities db;

        public CategoryRepository()
        {
            db = new ECommerceEntities();
        }
        public List<Category> GetAll()
        {
            List<Category> categoryList = db.Category.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return categoryList;
        }

        public Category GetById(int id)
        {
            Category category = db.Category.Where(s => s.CategoryId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return category;
        }

        public void Insert(Category entity)
        {
            db.Category.Add(entity);
            db.SaveChanges();
        }

        public void Update(Category entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public List<Category> GetAllMainCategory()
        {
            List<Category> categoryList = db.Category.Where(s => s.IsActive && !s.IsDeleted && s.TopCategoryId == 0).ToList();
            return categoryList;
        }

        public List<RecursiveCategoryList_Result> GetAllCategoryList()
        {
            return db.RecursiveCategoryList().ToList();
        }

        public List<Category> GetAllByTopCategoryId(int categoryId)
        {
            List<Category> categoryList = db.Category.Where(s => s.TopCategoryId == categoryId).ToList();
            return categoryList;
        }

    }
}
