using ECommerce.BIZ.Repository.DiscountKeyManagement;
using ECommerce.DATA;
using ECommerce.WEB.Areas.Admin.Model.DiscountKeyManagement;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Areas.Admin.Controllers.DiscountKeyManagement
{
    public class DiscountKeyController : Controller
    {
        DiscountKeyRepository discountKeyRepository;
        public DiscountKeyController()
        {
            discountKeyRepository = new DiscountKeyRepository();
        }
        // GET: Admin/DiscountKey
        public ActionResult Index()
        {
            List<DiscountKeyListViewModel> discountKeyList = discountKeyRepository.GetAll().Select(s => new DiscountKeyListViewModel()
            {
                CretaDate = s.CreateDate,
                Discount = s.Discount,
                DiscountKeyId = s.DiscountKeyId,
                ExpiredDate = s.ExpiredDate,
                GuidKey = s.GuidKey,
            }).ToList();
            return View(discountKeyList);
        }

        [HttpGet]
        public ActionResult Insert()
        {
            DiscountKeyCRUDModel discountKeyCRUDModel = new DiscountKeyCRUDModel();
            return View(discountKeyCRUDModel);
        }
        [HttpPost]
        public ActionResult Insert(DiscountKeyCRUDModel discountKeyCRUDModel)
        {
            Response response;
            if (discountKeyCRUDModel.ExpiredDate != null)
            {
                if (discountKeyCRUDModel.ExpiredDate > DateTime.Now)
                {
                    response = new Response()
                    {
                        Message = "Bitiş tarihi bugünden büyük olmalı. ",
                        Status = false
                    };
                }
            }

            if (discountKeyCRUDModel.Count > 0)
            {
                response = new Response()
                {
                    Message = "Kupon adeti sıfırdan büyük olmalı",
                    Status = false,
                };
            }
            List<DiscountKey> discountKeyList = new List<DiscountKey>();
            for (int i = 0; i <= discountKeyCRUDModel.Count; i++)
            {

                DiscountKey discountKey = new DiscountKey()
                {
                    CreateDate = DateTime.Now,
                    Discount = discountKeyCRUDModel.Discount,
                    ExpiredDate = discountKeyCRUDModel.ExpiredDate,
                    IsActive = true,
                    GuidKey = Guid.NewGuid().ToString(),
                    IsDeleted = false,
                };
                discountKeyList.Add(discountKey);
            }
            discountKeyRepository.InsertMany(discountKeyList);
            response = new Response()
            {
                Message = "Kuponlar eklendi",
                RedirectUrl = Url.Action("Index", "DiscountKey"),
                Status = true
            };
            return Json(response);
        }

        public ActionResult Delete(int id = 0)
        {
            DiscountKey discountKey = discountKeyRepository.GetById(id);
            discountKey.IsActive = false;
            discountKey.IsDeleted = true;
            discountKeyRepository.Update(discountKey);
            return RedirectToAction("Index", "DiscountKey");

        }

        [HttpGet]
        public ActionResult Update(int id = 0)
        {
            DiscountKeyCRUDModel discountKeyCRUDModel = new DiscountKeyCRUDModel();
            DiscountKey discountKey = discountKeyRepository.GetById(id);
            discountKeyCRUDModel.ExpiredDate = discountKey.ExpiredDate;
            discountKeyCRUDModel.GuidKey = discountKey.GuidKey;
            discountKeyCRUDModel.DiscountKeyId = discountKey.DiscountKeyId;
            return View(discountKeyCRUDModel);
        }
        [HttpPost]
        public ActionResult Update(DiscountKeyCRUDModel discountKeyCRUDModel)
        {
            Response response;
            DiscountKey discountKey = discountKeyRepository.GetById(discountKeyCRUDModel.DiscountKeyId);
            if (discountKeyCRUDModel.ExpiredDate != null)
            {
                if (discountKeyCRUDModel.ExpiredDate > DateTime.Now)
                {
                    response = new Response()
                    {
                        Message = "Bitiş tarihi bugünden büyük olmalı. ",
                        Status = false
                    };
                }
            }
            discountKey.DiscountKeyId = discountKeyCRUDModel.DiscountKeyId;
            discountKey.ExpiredDate = discountKeyCRUDModel.ExpiredDate;
            discountKeyRepository.Update(discountKey);
            response = new Response()
            {
                Message = "Güncelleme Başarılı",
                RedirectUrl = Url.Action("Index", "DiscountKey"),
                Status = true
            };
            return Json(response);
        }
    }
}