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
    public class ProducersController : Controller
    {
        // Notes-13

        private readonly IProducersService _service;

        public ProducersController(IProducersService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            var producersdata = _service.GetAll();

            return View(producersdata);
        }

        //Get: Producers/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([Bind("FullName,ProfilePictureURL,Bio")] Producer producer)
        {
            if (!ModelState.IsValid)
            {
                return View(producer);
            }

            _service.Add(producer);

            return RedirectToAction(nameof(Index));
        }

        [AllowAnonymous]
        //Get: Producers/Details/1
        public IActionResult Details(int id)
        {
            var producerDetails = _service.GetById(id);

            if (producerDetails == null) return View("NotFound");

            return View(producerDetails);
        }

        //Get: Producers/Edit/1
        public IActionResult Edit(int id)
        {
            var producerDetails = _service.GetById(id);

            if (producerDetails == null) return View("NotFound");

            return View(producerDetails);

        }

        [HttpPost]
        public IActionResult Edit(int id, [Bind("Id,FullName,ProfilePictureURL,Bio")] Producer producer)
        {
            if (!ModelState.IsValid)
            {
                return View(producer);
            }

            _service.Update(id, producer);

            return RedirectToAction(nameof(Index));
        }


        //Get: Producers/Delete/1
        public IActionResult Delete(int id)
        {
            var producerDetails = _service.GetById(id); // varmı yokmu

            if (producerDetails == null) return View("NotFound");

            return View(producerDetails);

        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var producerDetails = _service.GetById(id); // varmı yokmu

            if (producerDetails == null) return View("NotFound");

            _service.Delete(id);

            return RedirectToAction(nameof(Index));
        }
    }
}
