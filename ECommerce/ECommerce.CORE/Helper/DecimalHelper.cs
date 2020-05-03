using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.CORE.Helper
{
   public static class DecimalHelper
    {
        /// <summary>
        /// Para birimini formatlar
        /// </summary>
        /// <param name="obj">Para birimi</param>
        /// <returns>Formatlanmış para birimi</returns>
        public static string ConvertToMoney(this decimal obj)
        {
            string resultValue = string.Format("{0:F2}", obj);
            return resultValue;
        }
    }
}
