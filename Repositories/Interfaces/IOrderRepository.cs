using AspExMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository.Interfaces
{
    public interface IOrderRepository
    {
        Task<IEnumerable<Order>> GetAllOrdersAsync();

        Task<Order> GetOrderAsync(int id);

        IEnumerable<Order> GetOrdersFromUser(string login);

        void AddOrder(Order order);
        Task RemoveOrderAsync(int id);
    }
}
