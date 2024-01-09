using eTickets.Data.ViewModels;
using eTickets_Web.Data.Base;
using eTickets_Web.Models;

namespace eTickets_Web.Data.Interfaces
{
    public interface IMoviesService : IEntityBaseRepository<Movie>
    {
        Movie GetMovieById(int id);

        NewMovieDropdownsVM GetNewMovieDropdownsValues();

        Movie AddNewMovie(NewMovieVM data);

        Movie UpdateMovie(NewMovieVM data);
    }
}
