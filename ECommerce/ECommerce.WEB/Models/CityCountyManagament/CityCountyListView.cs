using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Models.CityCountyManagament
{
    public class CityCountyListView
    {
        public int CityId { get; set; }

        public string Name  { get; set; }

        public Nullable<int> CountyId  { get; set; }
    }
}