using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Infrastructure
{
   public interface IRepository<T>
    {
        void Insert(T entity);

        void Update(T entity);

        T GetById(int id);

        List<T> GetAll();


    }
}
