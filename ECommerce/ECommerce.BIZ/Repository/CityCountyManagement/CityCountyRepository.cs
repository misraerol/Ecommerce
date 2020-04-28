using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.CityCountyManagement
{
    public class CityCountyRepository : IRepository<County>
    {
        ECommerceEntities db;
        public CityCountyRepository()
        {
            db = new ECommerceEntities();
        }
        public List<County> GetAll()
        {
            throw new NotImplementedException();
        }

        public County GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Insert(County entity)
        {
            throw new NotImplementedException();
        }

        public void Update(County entity)
        {
            throw new NotImplementedException();
        }

        public List<County> GetAllByCityId(int cityId)
        {
            List<County> counties = db.County.Where(s => s.CityId == cityId).ToList();
            return counties;
        }

        public List<City> GetAllCity()
        {
            List<City> cityList = db.City.Where(s => s.IsActive && !s.IsDeleted).ToList();

            return cityList;
        }

    }
}
