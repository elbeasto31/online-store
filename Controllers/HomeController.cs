using AspExMVC.Models;
using AspExMVC.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Controllers
{
    public class HomeController : Controller
    {


        public IActionResult Index()
        {
             return View();
        }



    }
}
