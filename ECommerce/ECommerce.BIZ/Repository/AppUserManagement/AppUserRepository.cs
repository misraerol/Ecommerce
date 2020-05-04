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
        public AppUser GetByEmail(string email)
        {
            AppUser appUser = db.AppUser.Where(s => s.Email.Equals(email)).SingleOrDefault();
            return appUser;
        }
        public AppUser GetByActivationCode(string activationCode)
        {
            AppUser appUser = db.AppUser.Where(s => s.IsActive && !s.IsDeleted && !s.IsActivation && s.ActivationCode.Equals(activationCode)).SingleOrDefault();
            return appUser;
        }
        public AppUser GetByActivation(string activationCode)
        {
            AppUser appUser = db.AppUser.Where(s => s.IsActive && !s.IsDeleted  && s.ActivationCode.Equals(activationCode)).SingleOrDefault();
            return appUser;
        }
        public AppUser GetByEmailAndPassword(string email, string password)
        {
            AppUser appUser = db.AppUser.Where(s => s.Email.Equals(email) && s.Password.Equals(password)).SingleOrDefault();
            return appUser;
        }
        public void InsertAppUserMapAddress(AppUserMapAddress entity)
        {
           
            db.AppUserMapAddress.Add(entity);
            db.SaveChanges();
        }
        public List<Address> GetAllAddress(int appUserId)
        {
            List<AppUserMapAddress> appUserMapAddressesList = db.AppUserMapAddress.Where(s => s.IsActive && !s.IsDeleted&& s.AppUserId==appUserId).ToList();
            List<Address> addressList = appUserMapAddressesList.Select(s => s.Address).ToList();
            return addressList;
        }
      

        public AppUserMapAddress GetByUserMapAddress(int id)
        {
            AppUserMapAddress appUserMapAddress = db.AppUserMapAddress.Where(s => s.AddressId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return appUserMapAddress;
        }
        public void UpdateAppUserMapAddress(AppUserMapAddress entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    
    }
}
