using ECommerce.BIZ.Infrastructure;
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
        public void InsertProductStoreWindow(ProductStoreWindow productStoreWindow)
        {
            db.ProductStoreWindow.Add(productStoreWindow);
            db.SaveChanges();
        }
    }
}
