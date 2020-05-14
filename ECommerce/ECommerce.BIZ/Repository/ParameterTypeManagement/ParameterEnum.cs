using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.BIZ.Repository.ParameterTypeManagement
{
   
    /// <summary>
    /// Ödeme Tipleri
    /// </summary>
    public enum ParameterPaymentType
    {
        /// <summary>
        /// Kapıda Ödeme
        /// </summary>
        PayAtTheDoor = 1,

        /// <summary>
        /// Kredi Kartı İle Ödeme
        /// </summary>
        PaymentByCreditCard = 2,
        /// <summary>
        /// Havale İle Ödeme
        /// </summary>
        PayWithMoneyOrder = 3
    }

    /// <summary>
    /// Sipariş Tipleri
    /// </summary>
    public enum ParameterOrderType
    {
        /// <summary>
        /// Hazırlanıyor
        /// </summary>
        Preparing=1,
        /// <summary>
        /// Kargoya Verilecek
        /// </summary>
        ToBeShipped = 2,
        /// <summary>
        /// Kargoya Verildi
        /// </summary>
        Shipped = 3,
        /// <summary>
        /// Sipariş Tamamlandı
        /// </summary>
        OrderComplete = 4,
        /// <summary>
        /// İade Edildi
        /// </summary>
        Returned = 5

    }


}
