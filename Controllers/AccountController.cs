using AspExMVC.Models;
using AspExMVC.Repository.Interfaces;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace AspExMVC.Controllers
{

    public class AccountController : Controller
    {

        private IUserRepository userRep;
        public AccountController(IUserRepository userRepos)
        {
            userRep = userRepos;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> LoginAsync(User model)
        {
            if (ModelState.IsValid)
            {

                User user = await userRep.GetUserAsync(model.login, model.password);
                if (user != null)
                {
                    await AuthenticateAsync(model.login);

                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("Wrong inputs", "Wrong login or password");
            }
            return View(model);
        }

        public IActionResult Register()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RegisterAsync(User model)
        {
            if (ModelState.IsValid)
            {
                User user = await userRep.GetUserAsync(model.login);

                if (user != null)
                    ModelState.AddModelError("Same logins", "User with this login is already registered");

                else if (!model.phone.All(char.IsDigit))
                    ModelState.AddModelError("wrong phone", "Phone must consist of numbers only");

                else
                {
                    //add user to database
                    userRep.AddUser(new User
                    {
                        login = model.login,
                        password = model.password,
                        user_name = model.user_name,
                        phone = model.phone,
                        address = model.address,
                        email = model.email
                    });


                    await AuthenticateAsync(model.login);

                    return RedirectToAction("Index", "Home");
                }
            }
            return View(model);
        }

        [Authorize]
        public async Task<IActionResult> LogoutAsync()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }

        //Conducts authentication for the chosen user
        private async Task AuthenticateAsync(string userName)
        {
            var claims = new List<Claim> { new Claim(ClaimsIdentity.DefaultNameClaimType, userName) };
            ClaimsIdentity id = new ClaimsIdentity(claims, "ApplicationCookie", ClaimsIdentity.DefaultNameClaimType, ClaimsIdentity.DefaultRoleClaimType);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(id));
        }
    }
}
