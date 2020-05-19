using ECommerce.BIZ.Infrastructure;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.ProductManagement
{
    public class ProductRepository : IRepository<Product>
    {
        ECommerceEntities db;
        public ProductRepository()
        {
            db = new ECommerceEntities();
        }

        public List<Product> GetAll()
        {
            List<Product> productList = db.Product.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return productList;
        }

        public Product GetById(int id)
        {
            Product product = db.Product.Where(s => s.ProductId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return product;
        }

        public void Insert(Product entity)
        {
            db.Product.Add(entity);
            db.SaveChanges();
        }

        public void Update(Product entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public void UpdateProductMapImage(ProductMapImage entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public ProductMapImage GetProductMapImageById(int id)
        {
            ProductMapImage productMapImage = db.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted && s.ProductMapImageId == id).SingleOrDefault();
            return productMapImage;
        }
        public List<ProductStoreWindow> GetAllProductStoreWindow()
        {
            List<ProductStoreWindow> productStoreWindows = db.ProductStoreWindow.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return productStoreWindows;
        }
        public ProductStoreWindow GetProductStoreWindowById(int id)
        {
            ProductStoreWindow productStoreWindow = db.ProductStoreWindow.Where(s => s.IsActive && !s.IsDeleted && s.ProductStoreWindowId == id).SingleOrDefault();
            return productStoreWindow;
        }
        public void InsertProductStoreWindow(ProductStoreWindow productStoreWindow)
        {
            db.ProductStoreWindow.Add(productStoreWindow);
            db.SaveChanges();
        }
        public bool AnyProductId(int productId)
        {
            bool anyProductId = db.ProductStoreWindow.Where(s => s.ProductId == productId && s.IsActive && !s.IsDeleted).Any();
            return anyProductId;
        }
        public ProductStoreWindow GetProductStoreWindowByProductId(int productId)
        {
            ProductStoreWindow productStoreWindow = db.ProductStoreWindow.Where(s => s.ProductId == productId && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return productStoreWindow;
        }
        public void InsertManyProductStoreWindow(List<ProductStoreWindow> productStoreWindowList)
        {
            db.ProductStoreWindow.AddRange(productStoreWindowList);
            db.SaveChanges();
        }
        public void UpdateProductStoreWindow(ProductStoreWindow productStoreWindow)
        {
            db.Entry(productStoreWindow).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        public List<ProductStoreWindow> GetProductStoreeManyRequestCount(int takeCount)
        {
            List<ProductStoreWindow> productStoreWindowList = db.ProductStoreWindow.Where(s => s.IsActive && !s.IsDeleted).OrderBy(s => Guid.NewGuid()).Take(takeCount).ToList();
            return productStoreWindowList;
        }

        public List<Product> GetProductManyRequestCountAndDecreaseProductList(int count, List<int> decreaseProductList)
        {
            List<Product> productList = db.Product.Where(s => !decreaseProductList.Contains(s.ProductId) && s.IsActive && !s.IsDeleted).OrderBy(s => Guid.NewGuid()).Take(count).ToList();

            return productList;
        }
        public List<Product> GetByProductName(string productName)
        {
            List<Product> products = db.Product.Where(s => s.Name.Contains(productName) && s.IsActive && !s.IsDeleted).ToList();
            return products;

        }
        public List<Product> GetByCategoryId(int id)
        {
 
            List<int> categoryIdList = db.GetRecursiveChildCategory(id).Select(a=>a.CategoryId.Value).ToList();
            List<Product> products = new List<Product>();
            products = db.Product.Where(s => s.IsActive && !s.IsDeleted && categoryIdList.Contains(s.CategoryId)).ToList();
            return products;
        }
    }
}
