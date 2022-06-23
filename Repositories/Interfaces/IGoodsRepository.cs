using AspExMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Repository
{
    public interface IGoodsRepository
    {
        Task<IEnumerable<Good>> GetAllGoodsAsync();

        Task<Good> GetGoodAsync(int id);
    }
}
