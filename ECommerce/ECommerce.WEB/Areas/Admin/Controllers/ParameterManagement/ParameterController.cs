using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.ParameterManagement;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.ParameterManagement
{
    [LoggedAdmin]
    public class ParameterController : Controller
    {
        ParameterRepository parameterRepository;
        ParameterTypeRepository parameterTypeRepository;
        public ParameterController()
        {
            parameterRepository = new ParameterRepository();
            parameterTypeRepository = new ParameterTypeRepository();
        }

        public ActionResult Index()
        {
            return View();
        }


        #region Ürün Özellikleri


        public ActionResult ProductPropertyList()
        {
            return View();
        }

        [HttpGet]
        public ActionResult InsertProductProperty()
        {
            ParameterCRUDModel parameterCRUDModel = new ParameterCRUDModel();
            return View(parameterCRUDModel);
        }

        [HttpPost]
        public ActionResult InsertProductProperty(ParameterCRUDModel parameterCRUDModel)
        {
            ParameterType parameterType = parameterTypeRepository.GetByName(ParameterTypeList.ProductProperty);

            Parameter parameterProductProperty = new Parameter()
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                Name = parameterCRUDModel.Name,
                ParameterTypeId= parameterType.ParameterTypeId
            };

            parameterRepository.Insert(parameterProductProperty);
            return RedirectToAction("Imdex", "ProductPropertyList");
        }

        //public ActionResult UpdateProductProperty(int id = 0)
        //{ 
        //    Parameter parameter=
        //}


        #endregion


        #region Ürün Renkleri

        #endregion
    }
}