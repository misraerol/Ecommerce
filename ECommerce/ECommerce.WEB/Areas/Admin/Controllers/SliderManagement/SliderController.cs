using ECommerce.BIZ.Repository.SliderManagement;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.SliderManagement;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.SliderManagement
{
    [LoggedAdmin]
    public class SliderController : Controller
    {
        // GET: Admin/Slider
        SliderRepository sliderRepository;
        public SliderController()
        {
            sliderRepository = new SliderRepository();
        }
        public ActionResult Index()
        {
            List<SliderListView> sliderListView = sliderRepository.GetAll().Select(s => new SliderListView()
            {
                CretaDate = s.CreateDate,
                ExpiredDate = s.ExpiredDate,
                ImagePath = s.ImagePath,
                RedirectUrl = s.RedirectUrl,
                SliderId = s.SliderId,
                Title = s.Title
            }).ToList();
            return View(sliderListView);
        }
        [HttpGet]
        public ActionResult Insert()
        {
            SliderCRUDModel sliderCRUDModel = new SliderCRUDModel();
            sliderCRUDModel.CretaDate = DateTime.Now;
            return View(sliderCRUDModel);
        }
        [HttpPost]
        public ActionResult Insert(SliderCRUDModel sliderCRUDModel)
        {
            Response response;
            string fileName = string.Empty;
            if (sliderCRUDModel.ImagePath != null)
            {
                fileName = FileHelper.GenerateFileName(sliderCRUDModel.ImagePath.FileName);
                sliderCRUDModel.ImagePath.SaveAs(Server.MapPath("~/Uploads/SliderImage/" + fileName));
            }
            Slider slider = new Slider()
            {
                Title = sliderCRUDModel.Title,
                CreateDate = sliderCRUDModel.CretaDate,
                ExpiredDate = sliderCRUDModel.ExpiredDate,
                RedirectUrl = sliderCRUDModel.RedirectUrl,
                ImagePath = fileName,
                IsActive = true,
                IsDeleted = false
            };
            sliderRepository.Insert(slider);
            response = new Response()
            {
                Message = "Slider Kayıdı Yapıldı",
                RedirectUrl = Url.Action("Index", "Slider"),
                Status = true,
            };

            return Json(response);

        }

        public ActionResult Delete(int id=0)
        {
            Slider slider = sliderRepository.GetById(id);
            if (slider != null)
            {
                slider.IsActive = false;
                slider.IsDeleted = true;
                sliderRepository.Update(slider);
            }
            return RedirectToAction("Index", "Slider");
        }
        [HttpGet]
        public ActionResult Update(int id = 0)
        {
            SliderCRUDModel sliderCRUDModel = new SliderCRUDModel();
            Slider slider = sliderRepository.GetById(id);
            if(slider != null)
            {
                sliderCRUDModel.Title = slider.Title;
                sliderCRUDModel.ExpiredDate= slider.ExpiredDate;
                sliderCRUDModel.CretaDate= slider.CreateDate  ;
                sliderCRUDModel.RedirectUrl = slider.RedirectUrl;
                sliderCRUDModel.SliderId= slider.SliderId ;
                return View(sliderCRUDModel);
            }
            return RedirectToAction("Index", "Slider");
        }
        [HttpPost]
        public ActionResult Update(SliderCRUDModel sliderCRUDModel)
        {
            Response response;
            Slider slider = sliderRepository.GetById(sliderCRUDModel.SliderId);
            if(slider != null)
            {
                slider.Title = sliderCRUDModel.Title;
                slider.RedirectUrl = sliderCRUDModel.RedirectUrl;
                slider.ExpiredDate = sliderCRUDModel.ExpiredDate;
                slider.CreateDate = sliderCRUDModel.CretaDate;
                if(sliderCRUDModel.ImagePath != null)
                {
                    if(sliderCRUDModel.ImagePath.FileName != null)
                    {
                        string fileName = FileHelper.GenerateFileName(sliderCRUDModel.ImagePath.FileName);
                        sliderCRUDModel.ImagePath.SaveAs(Server.MapPath("~/Uploads/SliderImage/" + fileName));
                        slider.ImagePath = fileName;
                    }
                }
                sliderRepository.Update(slider);
                response = new Response()
                {
                    Message = "Kayıt Güncellendi",
                    RedirectUrl = Url.Action("Index", "Slider"),
                    Status = true
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Güncelleme işlemi başarısız",
                    Status = false
                };
            }
            return Json(response);
        }
    }


}