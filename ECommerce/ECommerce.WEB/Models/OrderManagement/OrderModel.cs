using ECommerce.WEB.Models.ProductManagament;
using ECommerce.WEB.Models.UserCartManagamenet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Models.OrderManagement
{
    public class OrderModel
    {
        public int AddressId { get; set; }

        public SelectList AddressList { get; set; }

        public int ParameterPaymentId { get; set; }

        public SelectList ParameterPayment { get; set; }

        public UserCartModel UserCartModel { get; set; }

        
    }
}