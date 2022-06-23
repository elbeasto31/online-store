using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace AspExMVC.Models
{
    public class Order
    {
        [Key]
        public int order_id { get; set; }

        //login of user that placed the order
        public string login { get; set; }

        public int good_id { get; set; }

        [MaxLength(100)]
        public string comment { get; set; }


    }
}
