using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.ParameterManagement
{
    public class ParameterRepository : IRepository<Parameter>
    {
		ECommerceEntities db;
		public ParameterRepository()
		{
			db = new ECommerceEntities();
		}

		public List<Parameter> GetAll()
		{
			List<Parameter> parametersList = db.Parameter.Where(s => s.IsActive && !s.IsDeleted).ToList();
			return parametersList;
		}

		public Parameter GetById(int id)
		{
			Parameter parameter = db.Parameter.Where(s => s.ParameterId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
			return parameter;
		}

		public void Insert(Parameter entity)
		{
			db.Parameter.Add(entity);
			db.SaveChanges();
		}

		public void Update(Parameter entity)
		{
			db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
			db.SaveChanges();
		}

	}
}
