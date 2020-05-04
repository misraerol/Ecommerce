using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.AdminUserManagement
{
    public class AdminUserRepository : IRepository<AdminUser>
    {
        ECommerceEntities db;
        public AdminUserRepository()
        {
            db = new ECommerceEntities();
        }
        public List<AdminUser> GetAll()
        {
            List<AdminUser> adminUserList = db.AdminUser.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return adminUserList;
        }

        public AdminUser GetById(int id)
        {
            AdminUser adminUser = db.AdminUser.Where(s => s.AdminUserId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return adminUser;
        }

        public void Insert(AdminUser entity)
        {
            db.AdminUser.Add(entity);
            db.SaveChanges();
        }

        public void Update(AdminUser entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public AdminUser GetByEmailAndPassword(string email, string password)
        {
            AdminUser adminUser = db.AdminUser.Where(s => s.Email.Equals(email) && s.Password.Equals(password) && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return adminUser;
        }


        public bool IsUseEmailAddress(string email)
        {
            bool isHave = db.AdminUser.Where(s => s.Email.Equals(email)).Any();
            return isHave;
        }

        public AdminUser GetByEmail(string email)
        {
            AdminUser adminUser = db.AdminUser.Where(s => s.Email.Equals(email)).SingleOrDefault();
            return adminUser;
        }
        public AdminUser GetByActivationCode(string activationCode)
        {
            AdminUser adminUser = db.AdminUser.Where(s => !s.IsActive && !s.IsDeleted && s.ActivationCode.Equals(activationCode)).SingleOrDefault();
            return adminUser;
        }
        public AdminUser GetByActivation(string activationCode)
        {
            AdminUser adminUser = db.AdminUser.Where(s => s.IsActive && !s.IsDeleted && s.ActivationCode.Equals(activationCode)).SingleOrDefault();
            return adminUser;
        }

    }
}
