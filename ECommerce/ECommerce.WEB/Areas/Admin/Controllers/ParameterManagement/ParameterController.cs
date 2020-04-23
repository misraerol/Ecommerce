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
            List<ParameterListView> parameterList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.ProductProperty).Select(a=> new ParameterListView()
            {
                Name=a.Name,
                ParameterId=a.ParameterId
            }).ToList();

            return View(parameterList);
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
            Response response;


            ParameterType parameterType = parameterTypeRepository.GetByName(ParameterTypeList.ProductProperty);

            Parameter parameter = new Parameter()
            {
                IsActive = true,
                CreateDate = DateTime.Now,
                IsDeleted = false,
                Name = parameterCRUDModel.Name,
                ParameterTypeId = parameterType.ParameterTypeId
            };

            Parameter controlParameter = parameterRepository.GetByParameterNameAndParameterTypeId(parameterCRUDModel.Name, parameterType.ParameterTypeId);

            if (controlParameter != null)
            {
                response = new Response()
                {
                    Message = "Bu Kayıt Daha Önce Oluşturulmuş",
                    Status = false,
                };
                return Json(response);
            }

            parameterRepository.Insert(parameter);

            response = new Response()
            {
                Message = "Kayıt Oluşturuldu",
                Status = true,
                RedirectUrl = Url.Action("ProductPropertyList", "Parameter")
            };
            return Json(response);
        }
        [HttpGet]
        public ActionResult UpdateProductProperty(int id = 0)
        {
            Parameter parameter = parameterRepository.GetById(id);

            if (parameter != null)
            {
                ParameterCRUDModel parameterCRUDModel = new ParameterCRUDModel()
                {
                    Name = parameter.Name,
                    ParameterId = parameter.ParameterId
                };

                return View(parameterCRUDModel);
            }
            else
            {
                return RedirectToAction("ProductPropertyList", "Parameter");
            }
        }
        [HttpPost]
        public JsonResult UpdateProductProperty(ParameterCRUDModel parameterCRUDModel)
        {
            Response response;
            Parameter parameter = parameterRepository.GetById(parameterCRUDModel.ParameterId);

            parameter.Name = parameterCRUDModel.Name;

            Parameter controlParameter = parameterRepository.GetByParameterNameAndParameterTypeId(parameterCRUDModel.Name, parameter.ParameterTypeId);

            if (controlParameter != null)
            {
                if (controlParameter.ParameterId != parameter.ParameterId)
                {
                    response = new Response()
                    {
                        Message = "Bu Kayıt Kullanılmaktadır.",
                        Status = false,
                    };
                    return Json(response);
                }
            }


            parameterRepository.Update(parameter);

            response = new Response()
            {
                Message = "Kayıt Güncellendi",
                Status = true,
                RedirectUrl = Url.Action("ProductPropertyList", "Parameter")
            };
            return Json(response);
        }


        public ActionResult DeleteProductProperty(int id = 0)
        {
            Parameter parameter = parameterRepository.GetById(id);

            if (parameter != null)
            {
                parameter.IsDeleted = true;

                parameterRepository.Update(parameter);
            }

            return RedirectToAction("ProductPropertyList", "Parameter");
        }

        #endregion


        #region Ürün Renkleri

        #endregion
    }
}