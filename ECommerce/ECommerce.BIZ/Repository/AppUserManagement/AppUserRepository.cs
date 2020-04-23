using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.AppUserManagement
{
    public class AppUserRepository : IRepository<AppUser>
    {
        ECommerceEntities db;

        public AppUserRepository()
        {
            db = new ECommerceEntities();
        }

        public List<AppUser> GetAll()
        {
            List<AppUser> appUserList = db.AppUser.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return appUserList;
        }

        public AppUser GetById(int id)
        {
            AppUser appUser = db.AppUser.Where(s => s.AppUserId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return appUser;
        }

        public void Insert(AppUser entity)
        {
            db.AppUser.Add(entity);
            db.SaveChanges();
        }

        public void Update(AppUser entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public bool AnyUserEmail(string email)
        {
            bool anyUserEmail = db.AppUser.Where(s => s.Email.Equals(email)).Any();
            return anyUserEmail;
        }
        public AppUser GetByEmailAndPassword(string email , string password)
        {
            AppUser appUser = db.AppUser.Where(s => s.Email.Equals(email) && s.Password.Equals(password)).SingleOrDefault();
            return appUser;
        }

    }
}
