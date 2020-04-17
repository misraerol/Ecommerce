using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ECommerce.WEB.Controllers
{
    public class BaseController : Controller
    {
        public new JsonResult Json(object data)
        {
            JsonResult json = new JsonResult();
            json.Data = data;
            json.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return json;
        }
        protected override void Initialize(RequestContext requestContext)
        {
            HttpCookie cookie;
            try
            {
                //HttpCookie languageCookie = ;
                if (requestContext.HttpContext.Request.Cookies["cultureInfo"] != null)
                {
                    cookie = requestContext.HttpContext.Request.Cookies["cultureInfo"];
                }
                else
                {
                    //string cultureString = requestContext.HttpContext.Request.UserLanguages[0];
                    string cultureString = ConfigurationManager.AppSettings["SystemDefaultLanguageCultureCode"];
                    cookie = new HttpCookie("cultureInfo");
                    cookie["cultureCode"] = cultureString;
                    cookie.Expires = DateTime.Now.AddDays(365);
                    requestContext.HttpContext.Response.Cookies.Add(cookie);
                }
            }
            catch
            {
                //string cultureString = requestContext.HttpContext.Request.UserLanguages[0];
                string cultureString = ConfigurationManager.AppSettings["SystemDefaultLanguageCultureCode"];
                cookie = new HttpCookie("cultureInfo");
                cookie["cultureCode"] = cultureString;
                cookie.Expires = DateTime.Now.AddDays(365);
                requestContext.HttpContext.Response.Cookies.Add(cookie);
            }
            var cultureInfo = new CultureInfo(cookie["cultureCode"]);

            /*if (cultureInfo.Name == "tr-TR")
			{
				DateTimeFormatInfo turkishDateFormat = cultureInfo.DateTimeFormat;
				turkishDateFormat.ShortDatePattern = "dd.MM.yyyy";
				cultureInfo.DateTimeFormat = turkishDateFormat;
			}*/

            Thread.CurrentThread.CurrentCulture = cultureInfo;
            Thread.CurrentThread.CurrentUICulture = cultureInfo;
            //requestContext.HttpContext.Session.LCID = cultureInfo.LCID;

            base.Initialize(requestContext);
        }

    }
}