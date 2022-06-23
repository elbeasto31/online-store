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

    [Authorize]
    public class ProfileController : Controller
    {
        //returns info about current user
        private async Task<User> currentUser() => await userRep.GetUserAsync(User.Identity.Name);

        private IUserRepository userRep;

        private IOrderRepository orderRep;

        private IGoodsRepository goodRep;

        public ProfileController(IUserRepository userRepos, IOrderRepository orderRepos, IGoodsRepository goodRepos)
        {
            userRep = userRepos;
            orderRep = orderRepos;
            goodRep = goodRepos;
        }

        //displays user's orders
        public async Task<IActionResult> OrdersAsync()
        {
            ViewBag.Goods = await goodRep.GetAllGoodsAsync();
            return View(orderRep.GetOrdersFromUser(User.Identity.Name));
        }

        //profile info page
        public async Task<IActionResult> IndexAsync()
        {

            return View(await currentUser());
        }

        //removes user's account
        public async Task<IActionResult> RemoveAsync()
        {
            userRep.RemoveUser(await currentUser());
            return RedirectToAction("Logout", "Account");
        }


        //edits user's profile
        public async Task<IActionResult> EditAsync()
        {
            return View(await currentUser());
        }

        [HttpPost]
        public async Task<IActionResult> EditAsync(User model)
        {
            if (ModelState.IsValid)
            {
                //checks whether phone field contains only numbers
                if (model.phone.All(char.IsDigit))
                {
                    userRep.UpdateUser(model);

                    return RedirectToAction("Index", "Profile");
                }
                else
                    ModelState.AddModelError("wrong phone", "Phone must consist of numbers only");
            }
            return View(model);
        }

        
    }
}
