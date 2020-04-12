using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ECommerce.WEB.Utility.Attribute
{
    public class LoggedAdminAttribute: ActionFilterAttribute, IActionFilter
    {
        void IActionFilter.OnActionExecuting(ActionExecutingContext filterContext)
        {
            string actionReturnType = (filterContext.ActionDescriptor as ReflectedActionDescriptor).MethodInfo.ReturnType.Name;

            var sessionControl = filterContext.HttpContext.Session["LoggedAdmin"];
            if (sessionControl == null)
            {
                if (actionReturnType == "ActionResult")
                {
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary { { "controller", "Home" }, { "action", "Index" },{ "Area","Admin"} });
                }
                else if (actionReturnType == "JsonResult")
                {
                    filterContext.Result = new JsonResult
                    {
                        Data = new Response()
                        {
                            Message = "Lütfen Giriş Yapınız",
                            Status = false
                        },
                        JsonRequestBehavior = JsonRequestBehavior.AllowGet
                    };
                }
            }
        }
    }
}