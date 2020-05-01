using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.DiscountKeyManagement
{
    public class DiscountKeyRepository : IRepository<DiscountKey>
    {
        ECommerceEntities db;
        public DiscountKeyRepository()
        {
            db = new ECommerceEntities();
        }
        public List<DiscountKey> GetAll()
        {
            List<DiscountKey> discountKeyList = db.DiscountKey.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return discountKeyList;
        }

        public DiscountKey GetById(int id)
        {
            DiscountKey discountKey = db.DiscountKey.Where(s => s.DiscountKeyId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return discountKey;
        }

        public void Insert(DiscountKey entity)
        {
            db.DiscountKey.Add(entity);
            db.SaveChanges();
        }

        public void InsertMany(List<DiscountKey> entity)
        {
            db.DiscountKey.AddRange(entity);
            db.SaveChanges();
        }

        public void Update(DiscountKey entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
