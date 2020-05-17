using ECommerce.BIZ.Infrastructure;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.OrderManagement
{
    public class OrderRepository : IRepository<Order>
    {
        ECommerceEntities db;
        public OrderRepository()
        {
            db = new ECommerceEntities();
        }
        public List<Order> GetAll()
        {
            List<Order> orderList = db.Order.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return orderList;
        }

        public Order GetById(int id)
        {
            Order order = db.Order.Where(s => s.IsDeleted && !s.IsDeleted && s.OrderId == id).SingleOrDefault();
            return order;
        }
        public List<OrderDetail> GetHistoryProduct()
        {
            List<OrderDetail> orderDetailList = db.OrderDetail.Where(s => s.IsActive && !s.IsDeleted).ToList();
            return orderDetailList;
        }
        public void Insert(Order entity)
        {
            db.Order.Add(entity);
            db.SaveChanges();
        }

        public void Update(Order entity)
        {
            db.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
