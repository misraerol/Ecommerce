using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.ParameterTypeManagement
{
    public class ParameterTypeRepository : IRepository<ParameterType>
    {
		ECommerceEntities db;
		public ParameterTypeRepository()
		{
			db = new ECommerceEntities();
		}

		public List<ParameterType> GetAll()
		{
			List<ParameterType> parameterTypeList = db.ParameterType.Where(s => s.IsActive && !s.IsDeleted).ToList();
			return parameterTypeList;
		}

		public ParameterType GetById(int id)
		{
			ParameterType parameterType = db.ParameterType.Where(s => s.ParameterTypeId == id && s.IsActive && !s.IsDeleted).SingleOrDefault();
			return parameterType;
		}

		public void Insert(ParameterType entity)
		{
			db.ParameterType.Add(entity);
			db.SaveChanges();
		}

		public void Update(ParameterType entity)
		{
			db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
			db.SaveChanges();
		}

		public ParameterType GetByName(string parameterTypeName)
		{
			ParameterType parameterType = db.ParameterType.Where(s => s.Name.Equals(parameterTypeName) && s.IsActive && !s.IsDeleted).SingleOrDefault();
			return parameterType;
		}
	}
}
