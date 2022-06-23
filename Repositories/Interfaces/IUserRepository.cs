using AspExMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository.Interfaces
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetAllUsersAsync();

        void AddUser(User user);
        Task<User> GetUserAsync(string login);
        Task<User> GetUserAsync(string login, string password);

        void UpdateUser(User user);

        void RemoveUser(User user);
    }
}
