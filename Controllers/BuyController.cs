using AspExMVC.Models;
using AspExMVC.Repository;
using AspExMVC.Repository.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Controllers
{
    public class BuyController : Controller
    {
        //returns info about current user
        private async Task<User> currentUser() => await userRep.GetUserAsync(User.Identity.Name);

        private IGoodsRepository goodRep;

        private IOrderRepository orderRep;

        private IUserRepository userRep;

        public BuyController(IGoodsRepository goodRepos, IOrderRepository orderRepos, IUserRepository userRepos)
        {
            goodRep = goodRepos;
            orderRep = orderRepos;
            userRep = userRepos;
        }

        //removes order from user's profile
        [Authorize]
        public async Task<IActionResult> RemoveOrderAsync(int id)
        {
            await orderRep.RemoveOrderAsync(id);
            return RedirectToAction("Orders", "Profile");
        }

        //proceeds to the order placement
        [Authorize]
        public async Task<IActionResult> OrderAsync(int id)
        {
            ViewBag.User = await currentUser();
            return View(await goodRep.GetGoodAsync(id));
        }

        [HttpPost]
        public async Task<IActionResult> OrderAsync(Order order)
        {

            orderRep.AddOrder(order);

            return RedirectToAction("End", await currentUser());
        }

        //page with thanks for the purchase
        public IActionResult End(User user)
        {
            return View(user);
        }

    }
}
