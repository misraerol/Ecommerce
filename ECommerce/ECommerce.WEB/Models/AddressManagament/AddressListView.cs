using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.AddressManagament
{
    public class AddressListView
    {
        public int AddressId { get; set; }
        public string Title { get; set; }

        public string Phone { get; set; }

        public string NameSurname { get; set; }

        public string Explanation { get; set; }

        public DateTime CreateDate { get; set; }


        public string CityName { get; set; }

        public string CountyName { get; set; }
    }
}