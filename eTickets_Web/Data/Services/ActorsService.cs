using eTickets_Web.Data.Base;
using eTickets_Web.Data.Interfaces;
using eTickets_Web.Models;
using Microsoft.EntityFrameworkCore;

namespace eTickets_Web.Data.Services
{
    public class ActorsService : EntityBaseRepository<Actor>,IActorsService
    {

        public ActorsService(AppDbContext context) : base(context) // injection
        { 
        
        }

    }
}
