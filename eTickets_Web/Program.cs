using eTickets_Web.Data;
using eTickets_Web.Data.Interfaces;
using eTickets_Web.Data.Services;
using eTickets_Web.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddControllersWithViews();

        // DbContext Configuration
        // 8. adımdan önceki durum.
        //builder.Services.AddDbContext<AppDbContext>();
        // 8.adım
        builder.Services.AddDbContext<AppDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("Conn")));



        // Services Configuration
        // Scoped (Kapsamlı): Her service kapsamı için yeni bir örnek oluşturulur.
        // detaylı bilgi : https://peakup.org/blog/asp-net-core-dependency-injection-ve-servis-omurleri/
        builder.Services.AddScoped<IActorsService, ActorsService>(); 
        builder.Services.AddScoped<IProducersService, ProducersService>(); 
        builder.Services.AddScoped<ICinemasService, CinemasService>();
        builder.Services.AddScoped<IMoviesService, MoviesService>();

        // Authentication and Authorization
        builder.Services.AddIdentity<ApplicationUser, IdentityRole>().AddEntityFrameworkStores<AppDbContext>();
        builder.Services.AddMemoryCache();
        builder.Services.AddSession();
        builder.Services.AddAuthentication(options =>
        {
            options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
        });

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (!app.Environment.IsDevelopment())
        {
            app.UseExceptionHandler("/Home/Error");
            // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            app.UseHsts();
        }

        app.UseHttpsRedirection();

        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthentication(); // Kimlik doğrulama
        app.UseAuthorization(); // Yetkilendirme

        app.MapControllerRoute(
            name: "default",
            pattern: "{controller=Movies}/{action=Index}/{id?}");

        // Seeding Database

        //Seed database
        //AppDbInitializer.Seed(app);
        //AppDbInitializer.SeedUsersAndRolesAsync(app).Wait();

        app.Run();
    }
}

