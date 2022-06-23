using AspExMVC.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository
{
    public class EFGoodsRepository : IGoodsRepository
    {

        private AppDbContext db;

        public EFGoodsRepository(AppDbContext context)
        {
            db = context;
        }

        public async Task<IEnumerable<Good>> GetAllGoodsAsync()
        {
            return await db.Goods.ToListAsync();
        }

        public async Task<Good> GetGoodAsync(int id)
        {
            return await db.Goods.FirstOrDefaultAsync(it => it.good_id == id);
        }
    }
}
