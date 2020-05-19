using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.CORE.Helper
{
    public static class StringHelper
    {
        /// <summary>
        /// Para birimini formatlar
        /// </summary>
        /// <param name="obj">Para birimi</param>
        /// <returns>Formatlanmış para birimi</returns>
        public static string ConvertToMoney(this object obj)
        {
            string resultValue = string.Format("{0:F2}", obj);
            return resultValue;
        }


        /// <summary>
        /// Verilen kelimeleri parametredeki karaktere göre birleştirir.
        /// </summary>
        /// <param name="combineChar">Kelimeler arasındaki karakter</param>
        /// <param name="keyword">Birleştirilecek kelimeler</param>
        /// <returns></returns>
        public static string Combine(char combineChar, params string[] keyword)
        {
            string combinedText = string.Empty;
            foreach (string item in keyword)
            {
                combinedText += (item + combineChar);
            }
            return combinedText;
        }

        /// <summary>
        /// Bu metot verilen string değeri hashler.
        /// </summary>
        /// <param name="text">Hashlenecek Değer</param>
        /// <returns>Hashlenen Data</returns>
        public static string HashPassword(string text)
        {
            SHA256Managed cryptoManager = new SHA256Managed();
            byte[] utf8Text = System.Text.UTF8Encoding.UTF8.GetBytes(text);
            byte[] cryptedByteText = cryptoManager.ComputeHash(utf8Text);
            string cryptedText = string.Empty;
            for (short i = 0; i < cryptedByteText.Length; i++)
            {
                cryptedText += cryptedByteText[i].ToString("X2");
            }
            return cryptedText;

        }

        public static List<int> ParseCommatoListInt(string commaList)
        {
            List<int> result = new List<int>();

            foreach (string comma in commaList.Split(','))
            {
                if (!string.IsNullOrEmpty(comma))
                {
                    result.Add(int.Parse(comma));
                }
            }
            return result;
        }
    }
}
