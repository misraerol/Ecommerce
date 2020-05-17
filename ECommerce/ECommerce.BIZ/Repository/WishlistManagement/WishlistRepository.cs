using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.WishlistManagement
{
    public class WishlistRepository:IRepository<AppUserMapWish>
    {
        ECommerceEntities db;
        public WishlistRepository()
        {
            db = new ECommerceEntities();
        }

        public List<AppUserMapWish> GetAll()
        {
            List<AppUserMapWish> appUserMapWisList = db.AppUserMapWish.Where(s => s.IsActive && !s.IsDeleted ).ToList();
            return appUserMapWisList;
        }

        public AppUserMapWish GetById(int wishlistId)
        {
            AppUserMapWish appUserMapWish = db.AppUserMapWish.Where(s => s.IsActive && !s.IsDeleted&&s.AppUserMapWishId==wishlistId).SingleOrDefault();
            return appUserMapWish;
        }
        public AppUserMapWish GetByProductId(int productId)
        {
            AppUserMapWish appUserMapWish = db.AppUserMapWish.Where(s => s.IsActive && !s.IsDeleted && s.ProductId == productId).SingleOrDefault();
            return appUserMapWish;
        }
        public bool AnyProductId(int productId)
        {
            bool anyProductId = db.AppUserMapWish.Where(s => s.IsActive && !s.IsDeleted && s.ProductId == productId).Any();
            return anyProductId;
        }
        public void Insert(AppUserMapWish entity)
        {
            db.AppUserMapWish.Add(entity);
            db.SaveChanges();
        }

        public void Update(AppUserMapWish entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
