using eTickets_Web.Data;
using eTickets_Web.Data.Interfaces;
using eTickets_Web.Data.Static;
using eTickets_Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace eTickets_Web.Controllers
{
    [Authorize(Roles =UserRoles.Admin)]

    public class ActorsController : Controller
    {

        // Notes-12

        //private readonly AppDbContext _context;
        private readonly IActorsService _service;

        //public ActorsController(AppDbContext context)
        public ActorsController(IActorsService service)
        {
           _service = service;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            //var actorsdata=_context.Actors.ToList();
            var actorsdata = _service.GetAll();

            return View(actorsdata);
        }

        //Get: Actors/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create([Bind("FullName,ProfilePictureURL,Bio")] Actor actor)
        {
            if (!ModelState.IsValid)
            {
                return View(actor);
            }
            
            _service.Add(actor); // -> ActorsService
            
            return RedirectToAction(nameof(Index));
        }

        //public async Task<IActionResult> Create([Bind("FullName,ProfilePictureURL,Bio")] Actor actor)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return View(actor);
        //    }

        //    //_service.Add(actor); // -> ActorsService
        //    await _service.AddAsync(actor); // -> ActorsService

        //    return RedirectToAction(nameof(Index));
        //}

        //Get: Actors/Details/1
        [AllowAnonymous]
        public IActionResult Details(int id)
        {
            var actorDetails = _service.GetById(id); // varmı yokmu
            
            if (actorDetails == null) return View("NotFound");

            return View(actorDetails);
        }

        //public async Task<IActionResult> Details(int id)
        //{
        //    //var actorDetails = _service.GetById(id); // varmı yokmu
        //    var actorDetails = await _service.GetByIdAsync(id); // varmı yokmu

        //    if (actorDetails == null) return View("NotFound");

        //    return View(actorDetails);
        //}

        //Get: Actors/Edit/1
        public IActionResult Edit(int id)
        {
            var actorDetails = _service.GetById(id); // varmı yokmu

            if (actorDetails == null) return View("NotFound");

            return View(actorDetails);

        }

        [HttpPost]
        public IActionResult Edit(int id,[Bind("Id,FullName,ProfilePictureURL,Bio")] Actor actor)
        {
            if (!ModelState.IsValid)
            {
                return View(actor);
            }

            _service.Update(id,actor); // -> ActorsService

            return RedirectToAction(nameof(Index));
        }

        //Get: Actors/Delete/1
        public IActionResult Delete(int id)
        {
            var actorDetails = _service.GetById(id); // varmı yokmu

            if (actorDetails == null) return View("NotFound");

            return View(actorDetails);

        }

        [HttpPost,ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var actorDetails = _service.GetById(id); // varmı yokmu

            if (actorDetails == null) return View("NotFound");

            _service.Delete(id);

            return RedirectToAction(nameof(Index));
        }


    }
}
