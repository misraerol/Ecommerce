using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.UserCartManagament
{
    public class UserCartRepository : IRepository<UserCart>
    {
        ECommerceEntities db;
        public UserCartRepository()
        {
            db = new ECommerceEntities();
        }
        public List<UserCart> GetAll()
        {
            List<UserCart> userCarts = db.UserCart.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return userCarts;
        }

        public UserCart GetById(int id)
        {
            UserCart userChart = db.UserCart.Where(s => s.UserCartId == id).SingleOrDefault();
            return userChart;
        }
        public UserCart GetByProductId(int productId)
        {
            UserCart userCart = db.UserCart.Where(s => s.IsActive && !s.IsDeleted && s.ProductId == productId).SingleOrDefault();
            return userCart;
        }
        public void Insert(UserCart entity)
        {
            db.UserCart.Add(entity);
            db.SaveChanges();
        }

        public void Update(UserCart entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public void DecreaseByUserCartId(int userCartId)
        {
            UserCart userCart = db.UserCart.Where(s => s.IsActive && !s.IsDeleted && s.UserCartId == userCartId).SingleOrDefault();
            if(userCart != null)
            {
                userCart.ProductCount -= 1;
                db.SaveChanges();
            }
        }

        public void IncreaseByUserCartId(int userCartId)
        {
            UserCart userCart = db.UserCart.Where(s=> s.IsActive&& !s.IsDeleted && s.UserCartId == userCartId).SingleOrDefault();
            if(userCart != null)
            {
                userCart.ProductCount += 1;
                db.SaveChanges();
            }
        }
    }
}
