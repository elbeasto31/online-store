using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Models
{
    public class Good
    {
        [Key]
        public int good_id { get; set; }

        public string good_name { get; set; }

        public string description { get; set; }

        public int price { get; set; }

    }
}
