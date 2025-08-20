using GoHiking.data;
using GoHiking.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace GoHiking.Controllers
{
    public class ProductsController : Controller
    {
        private HikingDBEntities1 _db = new HikingDBEntities1();

        // GET: Products (主畫面)
        public ActionResult Index()
        {
            var products = _db.MountainTrails.ToList();
            return View(products);
        }

        // GET: Products/Details/5 (產品詳細頁面)
        public ActionResult Details(int id)
        {

            var mountainTrail = _db.MountainTrails.Find(id);

            if (mountainTrail == null)
            {
                return HttpNotFound();
            }

            return View(mountainTrail);
        }


        // GET: Products/Create (新增產品頁面)
        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var mountainTrail = _db.MountainTrails.Find(id);
            if (mountainTrail == null)
            {
                return HttpNotFound();
            }

            // 使用 ViewModel
            var viewModel = new TripGroupViewModel
            {
                mt_id = id.Value,
                user_id = 1,
                custom_schedule = mountainTrail.TripSchedule,
                max_participants = 20,
                price = 3500,
                activity_date = DateTime.Now.AddDays(30),
                meeting_time = "早上 07:00",
                meeting_location = "台北車站"
            };

            ViewBag.MountainTrail = mountainTrail;
            return View(viewModel);
        }


    }
}