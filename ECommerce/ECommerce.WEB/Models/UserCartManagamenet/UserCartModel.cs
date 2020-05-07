using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.UserCartManagamenet
{
    public class UserCartModel
    {
        public int UserCartId { get; set; }

        public string ImagePath { get; set; }

        public string ProductName { get; set; }

        public decimal Amount { get; set; }

        public int ProductId { get; set; }

        public int ProductCount { get; set; }
    }
}