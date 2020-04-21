using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.SliderManagement
{
    public class SliderRepository : IRepository<Slider>
    {
        ECommerceEntities db;
        public SliderRepository()
        {
            db = new ECommerceEntities();
        }
        public List<Slider> GetAll()
        {
            List<Slider> sliderList = db.Slider.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return sliderList;
        }

        public Slider GetById(int id)
        {
           Slider slider = db.Slider.Where(s => s.SliderId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
            return slider;
        }

        public void Insert(Slider entity)
        {
            db.Slider.Add(entity);
            db.SaveChanges();
        }

        public void Update(Slider entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }

        public List<Slider> GetAllActiveList()
        {
            List<Slider> sliderList = db.Slider.Where(s => s.IsActive && !s.IsDeleted && (s.ExpiredDate == null || s.ExpiredDate < DateTime.Now) && s.CreateDate > DateTime.Now).ToList();
            return sliderList;
        }
    }
}
