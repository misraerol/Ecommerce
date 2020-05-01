using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace ECommerce.CORE.Helper
{
    public class JsonHelper
    {
        public static string Convert(
            object Model,
            PreserveReferencesHandling reserveReferencesHandling = PreserveReferencesHandling.None,
            ReferenceLoopHandling referenceLoopHandling = ReferenceLoopHandling.Ignore)
        {
            JsonSerializerSettings SerializerSettings = new JsonSerializerSettings();
            SerializerSettings.MaxDepth = 1;
            SerializerSettings.PreserveReferencesHandling = reserveReferencesHandling;
            SerializerSettings.ReferenceLoopHandling = referenceLoopHandling;
            return JsonConvert.SerializeObject(Model, SerializerSettings);
        }
        public static MvcHtmlString ConvertToMvcHtmlString(
            object Model,
            PreserveReferencesHandling reserveReferencesHandling = PreserveReferencesHandling.None,
            ReferenceLoopHandling referenceLoopHandling = ReferenceLoopHandling.Ignore)
        {
            JsonSerializerSettings SerializerSettings = new JsonSerializerSettings();
            SerializerSettings.MaxDepth = 1;
            SerializerSettings.PreserveReferencesHandling = reserveReferencesHandling;
            SerializerSettings.ReferenceLoopHandling = referenceLoopHandling;
            var jsonString = JsonConvert.SerializeObject(Model, SerializerSettings);
            var htmlDecoded = MvcHtmlString.Create(jsonString);
            return htmlDecoded;
        }
    }
}
