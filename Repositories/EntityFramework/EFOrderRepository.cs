using AspExMVC.Models;
using AspExMVC.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository
{
    public class EFOrderRepository : IOrderRepository
    {

        private AppDbContext db;

        public EFOrderRepository(AppDbContext context)
        {
            db = context;
        }

        public IEnumerable<Order> GetOrdersFromUser(string login)
        {
            return db.Orders.Where(m => m.login == login);
        }

        public void AddOrder(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
        }

        public async Task RemoveOrderAsync(int id)
        {
            db.Orders.Remove(await GetOrderAsync(id));
            db.SaveChanges();
        }

        public async Task<IEnumerable<Order>> GetAllOrdersAsync()
        {
            return await db.Orders.ToListAsync();
        }

        public async Task<Order> GetOrderAsync(int id)
        {
            return await db.Orders.FirstOrDefaultAsync(it => it.order_id == id);
        }
    }
}
