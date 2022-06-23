using AspExMVC.Repository;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Controllers
{
    public class CatalogController : Controller
    {
        private IGoodsRepository rep;

        public CatalogController(IGoodsRepository repos)
        {
            rep = repos;
        }

        //displays store's goods list
        public async Task<IActionResult> IndexAsync()
        {
            return View(await rep.GetAllGoodsAsync());
        }
    }
}
