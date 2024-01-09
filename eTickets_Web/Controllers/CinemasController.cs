using eTickets_Web.Data;
using eTickets_Web.Data.Interfaces;
using eTickets_Web.Data.Static;
using eTickets_Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace eTickets_Web.Controllers
{
    [Authorize(Roles = UserRoles.Admin)]
    public class CinemasController : Controller
    {
        // Notes-14

        private readonly ICinemasService _service; 

        public CinemasController(ICinemasService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            var cinemasdata = _service.GetAll();

            return View(cinemasdata);
        }

        //Get: Cinemas/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([Bind("Logo,Name,Description")] Cinema cinema)
        {
            if (!ModelState.IsValid) return View(cinema);

            _service.Add(cinema);
            
            return RedirectToAction(nameof(Index));
        }

        [AllowAnonymous]
        //Get: Cinemas/Details/1
        public IActionResult Details(int id)
        {
            var cinemaDetails = _service.GetById(id);

            if (cinemaDetails == null) return View("NotFound");

            return View(cinemaDetails);
        }

        //Get: Cinemas/Edit/1
        public IActionResult Edit(int id)
        {
            var cinemaDetails = _service.GetById(id);

            if (cinemaDetails == null) return View("NotFound");

            return View(cinemaDetails);
        }

        [HttpPost]
        public IActionResult Edit(int id, [Bind("Id,Logo,Name,Description")] Cinema cinema)
        {
            if (!ModelState.IsValid) return View(cinema);

            _service.Update(id, cinema);

            return RedirectToAction(nameof(Index));
        }

        //Get: Cinemas/Delete/1
        public IActionResult Delete(int id)
        {
            var cinemaDetails = _service.GetById(id);

            if (cinemaDetails == null) return View("NotFound");

            return View(cinemaDetails);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirm(int id)
        {
            var cinemaDetails = _service.GetById(id);

            if (cinemaDetails == null) return View("NotFound");

            _service.Delete(id);

            return RedirectToAction(nameof(Index));
        }
    }
}
