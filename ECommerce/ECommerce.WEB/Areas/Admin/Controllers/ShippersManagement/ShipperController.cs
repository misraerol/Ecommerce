using ECommerce.BIZ.Repository.ShippersManagement;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.ShippersManagement;
using ECommerce.WEB.Controllers;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.ShippersManagement
{
    [LoggedAdmin]

    public class ShipperController : BaseController
    {
        ShippersRepository shippersRepository;
        public ShipperController()
        {
            shippersRepository = new ShippersRepository();
        }
        public ActionResult Index()
        {
            List<ShipperListView> shipperListView = shippersRepository.GetAll().Select(s=> new ShipperListView() { 
            Name=s.Name,
            ImagePath=s.ImagePath,
            CreateDate=s.CreateDate,
            ShipperId=s.ShipperId
            }).ToList();
            return View(shipperListView);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            ShipperCRUDModel shipperCRUDModel = new ShipperCRUDModel();
            return View(shipperCRUDModel);
        }
        [HttpPost]
        public ActionResult Insert(ShipperCRUDModel shipperCRUDModel)
        {
            Response response;
            bool useShippersName = shippersRepository.UseShippersName(shipperCRUDModel.Name);
            string fileName = string.Empty;
            if (!useShippersName)
            {

                if (shipperCRUDModel.ImagePath != null)
                {
                    if (shipperCRUDModel.ImagePath.FileName != null)
                    {
                        fileName = FileHelper.GenerateFileName(shipperCRUDModel.ImagePath.FileName);
                        shipperCRUDModel.ImagePath.SaveAs(Server.MapPath("~/Uploads/ShippersLogo/" + fileName));
                    }
                }
                Shipper shipper = new Shipper()
                {
                    Name = shipperCRUDModel.Name,
                    CreateDate = DateTime.Now,
                    IsActive = true,
                    IsDeleted = false,
                    ImagePath = fileName
                };
                shippersRepository.Insert(shipper);
                response = new Response()
                {
                    Message = "Kayıt Başarılı",
                    Status = true,
                    RedirectUrl = Url.Action("Index", "Shipper"),
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Kargo firması kayıtlı",
                    Status = false,
                };
            }
            return Json(response);
        }
        [HttpGet]
        public ActionResult Update(int id = 0)
        {
            ShipperCRUDModel shipperCRUDModel = new ShipperCRUDModel();
            Shipper shipper = shippersRepository.GetById(id);
            if (shipper != null)
            {
                shipperCRUDModel.Name = shipper.Name;
                shipperCRUDModel.ShipperId = shipper.ShipperId;

                return View(shipperCRUDModel);
            }
            else
            {
                return RedirectToAction("Index", "Shipper");
            }

        }
        [HttpPost]
        public ActionResult Update(ShipperCRUDModel shipperCRUDModel)
        {
            Response response;
            Shipper shipper = shippersRepository.GetById(shipperCRUDModel.ShipperId);
            if (shipper != null)
            {
                shipper.Name = shipperCRUDModel.Name;
                shipper.CreateDate = DateTime.Now;
                if (shipperCRUDModel.ImagePath != null)
                {
                    if (shipperCRUDModel.ImagePath.FileName != null)
                    {
                        string fileName = FileHelper.GenerateFileName(shipperCRUDModel.ImagePath.FileName);
                        shipperCRUDModel.ImagePath.SaveAs(Server.MapPath("~/Uploads/ShippersLogo/" + fileName));
                        shipper.ImagePath = fileName;
                    }
                }
                shippersRepository.Update(shipper);
                response = new Response()
                {
                    Message = "Kayıt Güncellendi",
                    Status = true,
                    RedirectUrl = Url.Action("Index", "Shipper")
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Güncelleme işlemi Başarısız",
                    Status = false,
                };
            }
            return Json(response);
        }

        public ActionResult Delete(int id = 0)
        {

            Shipper shipper = shippersRepository.GetById(id);
            if (shipper != null)
            {
                shipper.IsActive = false;
                shipper.IsDeleted = true;
                shippersRepository.Update(shipper);
            }
            return RedirectToAction("Index", "Shipper");
        }
    }

}