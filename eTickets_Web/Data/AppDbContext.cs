//using eTickets.Models;
using eTickets_Web.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace eTickets_Web.Data
{
    // Models <-> Db

    public class AppDbContext : IdentityDbContext<ApplicationUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }

        // İlişkilerin belirtilmesi 
        // temel sınıftaki metodun yerine kendi yazdığımızın çalışmasını gerçekleştirir
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // İlişkiler
            modelBuilder.Entity<Actor_Movie>().HasKey(acmo => new
            {
                acmo.ActorId,
                acmo.MovieId
            });

            modelBuilder.Entity<Actor_Movie>().HasOne(m => m.Movie).WithMany(acmo => acmo.Actors_Movies).HasForeignKey(m => m.MovieId);
            modelBuilder.Entity<Actor_Movie>().HasOne(m => m.Actor).WithMany(acmo => acmo.Actors_Movies).HasForeignKey(m => m.ActorId);


            base.OnModelCreating(modelBuilder);
        }

        // Table belirtimleri

        public DbSet<Actor> Actors { get; set; }
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Actor_Movie> Actors_Movies { get; set; }
        public DbSet<Cinema> Cinemas { get; set; }
        public DbSet<Producer> Producers { get; set; }
    }
}
