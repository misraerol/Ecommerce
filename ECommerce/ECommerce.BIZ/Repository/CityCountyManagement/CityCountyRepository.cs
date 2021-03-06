﻿using ECommerce.BIZ.Infrastructure;
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
            List<County> counties = db.County.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return counties;
        }

        public County GetById(int id)
        {
            County county = db.County.Where(s => s.IsActive && !s.IsDeleted && s.CountyId == id).SingleOrDefault();
            return county;
        }

        public void Insert(County entity)
        {
            db.County.Add(entity);
            db.SaveChanges();
        }

        public void Update(County entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
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
