using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.ShippersManagement
{
	public class ShippersRepository : IRepository<Shipper>

	{
		ECommerceEntities db;
		public ShippersRepository()
		{
			db = new ECommerceEntities();
		}

		public List<Shipper> GetAll()
		{
			List<Shipper> shippersList = db.Shipper.Where(s => s.IsActive && !s.IsDeleted).ToList();
			return shippersList;
		}

		public Shipper GetById(int id)
		{
			Shipper shipper = db.Shipper.Where(s => s.ShipperId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
			return shipper;
		}

		public void Insert(Shipper entity)
		{
			db.Shipper.Add(entity);
			db.SaveChanges();
		}

		public void Update(Shipper entity)
		{
			db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
			db.SaveChanges();
		}
		public bool UseShippersName(string name)
		{
			bool useShippersName = db.Shipper.Where(s => s.Name.Equals(name)).Any();
			return useShippersName;
		}
	}
}
