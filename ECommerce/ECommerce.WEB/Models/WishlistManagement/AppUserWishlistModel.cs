using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.WishlistManagement
{
    public class AppUserWishlistModel
    {
        public string ImagePath { get; set; }

        public string ProductName { get; set; }

        public decimal Amount { get; set; }

        public int AppUserMapWishId { get; set; }

        public int ProductId { get; set; }
    }
}