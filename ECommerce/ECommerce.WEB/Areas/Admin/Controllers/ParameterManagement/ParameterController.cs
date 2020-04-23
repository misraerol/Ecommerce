using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.ParameterManagement;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
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
        public JsonResult InsertProductProperty(ParameterCRUDModel parameterCRUDModel)
        {
            ParameterType parameterType = parameterTypeRepository.GetByName(ParameterTypeList.ProductProperty);

            Parameter parameter = new Parameter()
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                Name = parameterCRUDModel.Name,
                ParameterTypeId= parameterType.ParameterTypeId
            };

            parameterRepository.Insert(parameter);

            Response response = new Response()
            {
                Message="Kayıt Oluşturuldu",
                Status=true,
                RedirectUrl=Url.Action("InsertProductProperty","Parameter")
            };
            return Json(response);
        }

        public ActionResult UpdateProductProperty(int id = 0)
        {
            Parameter parameter = parameterRepository.GetById(id);

            if (parameter != null)
            {
                ParameterCRUDModel parameterCRUDModel = new ParameterCRUDModel()
                {
                    Name=parameter.Name,
                    ParameterId=parameter.ParameterId
                };

                return View(parameter);
            }
            else
            {
                return RedirectToAction("ProductPropertyList", "Parameter");
            }
        }

        public JsonResult UpdateProductProperty(ParameterCRUDModel parameterCRUDModel)
        {
            Parameter parameter = parameterRepository.GetById(parameterCRUDModel.ParameterId);

            parameter.Name = parameterCRUDModel.Name;

            parameterRepository.Update(parameter);

            Response response = new Response()
            {
                Message = "Kayıt Güncellendi",
                Status = true,
                RedirectUrl = Url.Action("ProductPropertyList", "Parameter")
            };
            return Json(response);
        }


        #endregion


        #region Ürün Renkleri

        #endregion
    }
}