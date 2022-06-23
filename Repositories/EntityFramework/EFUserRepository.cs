using AspExMVC.Models;
using AspExMVC.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository
{
    public class EFUserRepository : IUserRepository
    {
        private AppDbContext db;

        public EFUserRepository(AppDbContext context)
        {
            db = context;
        }
        public async Task<IEnumerable<User>> GetAllUsersAsync()
        {
            return await db.Users.ToListAsync();
        }

        public async Task<User> GetUserAsync(string login)
        {
            return await db.Users.SingleOrDefaultAsync(it => it.login == login);
        }

        public async Task<User> GetUserAsync(string login, string password)
        {
            return await db.Users.SingleOrDefaultAsync(u => u.login == login && u.password == password);
        }

        public void AddUser(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
        }

        public void UpdateUser(User user)
        {
            db.Users.Update(user);
            db.SaveChanges();
        }

        public void RemoveUser(User user)
        {
            db.Users.Remove(user);
            db.SaveChanges();
        }
    }
}
