using GoHiking.data;
using GoHiking.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GoHiking.Controllers
{
    public class UserController : Controller
    {
        private HikingDBEntities1 _db = new HikingDBEntities1();
        // GET: User
        public ActionResult Index()
        {
            List<User> model = _db.Users.ToList();

            return View(model);
        }

        // GET: User/Login
        public ActionResult Login()
        {

            return View();
        }

        // POST: User/Login
        [HttpPost]
        public ActionResult Login(User model)
        {
            var user = _db.Users.FirstOrDefault(x => x.UserName == model.UserName && x.Password == model.Password);

            if (user != null)
            {
                Session["UserLogin"] = user;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "帳號密碼檢查失敗");
                return View(model);

            }
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(UserViewModel model)
        {

            if (ModelState.IsValid)
            {

                bool userExists = _db.Users.Any(u => u.UserName == model.UserName);
                if (userExists)
                {
                    ModelState.AddModelError("UserName", "此帳號已被註冊過");
                    return View(model);
                }

                if (_db.Users.Any(u => u.Email == model.Email))
                {
                    ModelState.AddModelError("UserName", "此帳號已被註冊過");
                    return View(model);
                }

                User user = new User()
                {
                    UserName = model.UserName,
                    Password = model.Password,
                    Email = model.Email
                };

                _db.Users.Add(user);
                _db.SaveChanges();

                TempData["AccountCreated"] = true;
                return RedirectToAction("Login");

            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            User model = _db.Users.FirstOrDefault(x => x.Id == id);

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(User model)
        {

            //先把DB舊資料找回來
            User oldData = _db.Users.FirstOrDefault(x => x.Id == model.Id);

            //改成網頁送回來的資料
            oldData.UserName = model.UserName;
            oldData.Password = model.Password;
            oldData.Email = model.Email;
            _db.SaveChanges();

            return RedirectToAction("Index");
        }

        //GET:User/Delete/?
        public ActionResult Delete(int id)
        {
            User users = _db.Users.FirstOrDefault(x => x.Id == id);

            if (users != null)
            {
                _db.Users.Remove(users);
                _db.SaveChanges();
            }

            return RedirectToAction("Index");
        }




    }


}