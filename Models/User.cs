using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Models
{
    public class User
    {
       
        [Key]
        [MaxLength(20)]
        [Required]
        public string login { get; set; }

        [MaxLength(20)]
        [Required]
        public string password { get; set; }

        [MaxLength(20)]
        [Display(Name ="name")]
        [Required]
        public string user_name { get; set; }

        [MaxLength(100)]
        [Required]
        public string address { get; set; }

        [MaxLength(20)]
        [Required]
        public string phone { get; set; }

        [MaxLength(50)]
        [Required]
        public string email { get; set; }
    }
}
