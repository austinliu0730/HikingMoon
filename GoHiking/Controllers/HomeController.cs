using GoHiking.data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GoHiking.Controllers
{
    public class HomeController : Controller
    {
        private HikingDBEntities1 _db = new HikingDBEntities1();
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        // GET: Home/Blog
        public ActionResult Blog()
        {
            var mountainTrails = _db.MountainTrails.
                OrderBy(x => x.ID).
                Take(9).
                ToList();
            return View(mountainTrails);
        }

    }
}