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

        public List<Parameter> GetAllListByParameterTypeName(string parameterTypeName)
        {
            ParameterType parameterType = db.ParameterType.Where(s => s.Name.Equals(parameterTypeName) && s.IsActive && !s.IsDeleted).SingleOrDefault();

            List<Parameter> parameterList = db.Parameter.Where(s => s.ParameterTypeId== parameterType.ParameterTypeId && s.IsActive && !s.IsDeleted).ToList();
            return parameterList;
        }

        public Parameter GetByParameterNameAndParameterTypeId(string parameterName, int parameterTypeId)
        {
            Parameter parameter = db.Parameter.Where(s => s.Name.Equals(parameterName) && s.ParameterTypeId == parameterTypeId).SingleOrDefault();
            return parameter;
        }

        public Parameter GetParameterByTypeValue(int typeValue)
        {
            Parameter parameter = db.Parameter.Where(s => s.IsActive && !s.IsDeleted && s.TypeValue == typeValue).SingleOrDefault();
            return parameter;
        }
    }
}
