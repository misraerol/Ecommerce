using ECommerce.BIZ.Repository.AppUserManagement;
using ECommerce.DATA;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.SessionState;

namespace ECommerce.WEB
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            GlobalFilters.Filters.Add(new ValidateInputAttribute(false));//Validate Input false için yazıldı
        }

        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            if (Context.Handler is IRequiresSessionState || Context.Handler is IReadOnlySessionState)
            {
                HttpContext context = HttpContext.Current;

                if (HttpContext.Current.Session["LoggedUser"] == null)
                {
                    HttpCookie cookie = HttpContext.Current.Request.Cookies["AppUser"];
                    if (cookie != null)
                    {
                        AppUserRepository appUserRepository = new AppUserRepository();


                        string email = cookie.Values["email"];

                        string password = cookie.Values["password"];

                        AppUser appUser = appUserRepository.GetByEmailAndPassword(email, password);

                        if (appUser != null)
                        {
                            Session.Add("LoggedUser", appUser);

                        }
                    }
                }

            }
        }

    }
}
