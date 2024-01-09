using eTickets_Web.Data.Base;
using System.ComponentModel.DataAnnotations;

namespace eTickets_Web.Models
{
    public class Cinema : IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Cinema Logo")]
        public string Logo { get; set; }

        [Display(Name = "Cinema Name")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        public string Description { get; set; }

        //Relationships
        public List<Movie>? Movies { get; set; } // Bir cinemada birçok film olabilir
    }
}
