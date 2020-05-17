using ECommerce.WEB.Models.ProductManagament;
using ECommerce.WEB.Models.UserCartManagamenet;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Models.OrderManagement
{
    public class OrderModel
    {
        [DisplayName("Lütfen Adres seçiniz")]
        [Required]
        public int AddressId { get; set; }

        public SelectList AddressList { get; set; }

        public int ParameterPaymentId { get; set; }

        [Required]
        public SelectList ParameterPayment { get; set; }

        public UserCartModel UserCartModel { get; set; }

        
    }
}