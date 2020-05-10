using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Utility.ModelBinder
{
    public class ModelBinderForDecimal : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            ValueProviderResult valueResult = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);

            decimal? actualValue = null;

            try
            {
                if (!String.IsNullOrEmpty(valueResult.AttemptedValue))
                {
                     string replace= valueResult.AttemptedValue.Replace('.', ',');

                    string decimalCulture = ConfigurationManager.AppSettings["DecimalCulture"];
                    actualValue = Convert.ToDecimal(replace, CultureInfo.GetCultureInfo(decimalCulture));
                }
            }
            catch { }

            return actualValue;
        }
    }
}