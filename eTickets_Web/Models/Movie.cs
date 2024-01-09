﻿//using eTickets.Models;
using eTickets_Web.Data.Base;
using eTickets_Web.Data.Enums;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eTickets_Web.Models
{
    public class Movie : IEntityBase
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Movie Name")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        public string Description { get; set; }

        [Display(Name = "Ticket Price")]
        public double Price { get; set; }

        [Display(Name = "Affiche")]
        public string ImageURL { get; set; }

        [Display(Name = "Start Date")]
        public DateTime StartDate { get; set; }

        [Display(Name = "End Date")]
        public DateTime EndDate { get; set; }
        
        public MovieCategory MovieCategory { get; set; } // Data_Enum

        //Relationships
        //(Many to Many)
        public List<Actor_Movie>? Actors_Movies { get; set; }

        //Cinema
        // One to Many
        public int CinemaId { get; set; }
        [ForeignKey("CinemaId")]
        public Cinema Cinema { get; set; }

        //Producer
        // One to Many
        public int ProducerId { get; set; }
        [ForeignKey("ProducerId")]
        public Producer Producer { get; set; }
    }
}
