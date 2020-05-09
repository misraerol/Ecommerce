using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.CORE.Helper
{
  public  static class CalculateHelper
    {
        public static decimal CalculateDiscountAmount(decimal discountRate,decimal amount)
        {
            decimal result = 0;
            if (discountRate > 0)
            {
                result = amount - amount * discountRate / 100;
            }
            else
            {
                result = amount;
            }
            return result;
        }
    }
}
