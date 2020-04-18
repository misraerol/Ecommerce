using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.CORE.Helper
{
    public static class FileHelper
    {
        /// <summary>
        /// Gönderilen Dosya'nın uzantısını bulup yerine yeni random isimini ve aynı uzantısını gönderen metoddur
        /// </summary>
        /// <param name="extension">Gönderilen dosya uzantısı</param>
        /// <returns>Dosyadı adını ve uzantısını döndürür</returns>
        public static string GenerateFileName(string fileName)
        {
            string fileExtension = System.IO.Path.GetExtension(fileName);
            string newFileName = string.Empty;
            if (!string.IsNullOrEmpty(fileExtension))
            {
                //Extension dolu ise random isim verip sonuna extension ekliyor.
                newFileName = string.Format($"{Guid.NewGuid().ToString().Substring(0, 10)}{DateTime.Now.ToFileTimeUtc()}{fileExtension.ToLower()}");
            }
            else
            {
                ///Extension'u boş ise random bir isim veriyor.
                newFileName = string.Format($"{Guid.NewGuid().ToString().Substring(0, 10)}{DateTime.Now.ToFileTimeUtc()}");
            }
            return newFileName;
        }

    }
}
