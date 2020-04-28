using ECommerce.BIZ.Repository.AppUserManagement;
using ECommerce.BIZ.Repository.CityCountyManagement;
using ECommerce.DATA;
using ECommerce.WEB.Models.AddressManagament;
using ECommerce.WEB.Models.CityCountyManagament;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.AddressManagement
{
    [LoggedUser]
    public class AddressController : Controller
    {

        AppUserRepository appUserRepository;
        CityCountyRepository cityCountyRepository;
        // GET: Address

        public AddressController()
        {
            appUserRepository = new AppUserRepository();
            cityCountyRepository = new CityCountyRepository();
        }
        public ActionResult Index()
        {
            AppUser appUser = (AppUser)Session["LoggedUser"];

            List<AddressListView> addressListView = appUserRepository.GetAllAddress(appUser.AppUserId).Select(s => new AddressListView
            {
                Explanation = s.Explanation,
                Title = s.Title,
                AddressId = s.AddressId,
                CreateDate=DateTime.Now,
                Phone=s.Phone,
                NameSurname=s.NameSurname,
                CityName=s.County.City.Name,
                CountyName=s.County.Name,
                
            }).ToList();
            return View(addressListView);
        }
        public ActionResult Insert()
        {
            AddressCRUDModel addressCRUDModel = new AddressCRUDModel();

            List<City> cityList = cityCountyRepository.GetAllCity();
            addressCRUDModel.CityList =new SelectList(cityList,"CityId","Name");
            addressCRUDModel.CountyList = new SelectList(string.Empty);
            return View(addressCRUDModel);
        }
        [HttpPost]
        public ActionResult Insert(AddressCRUDModel addressCRUDModel)
        {
            Response response;
            AppUser appUser = (AppUser)Session["LoggedUser"];
            Address address = new Address()
            {
                Title = addressCRUDModel.Title,
                Explanation = addressCRUDModel.Explanation,
                CreateDate = DateTime.Now,
                CountyId = addressCRUDModel.CountyId,
                IsActive = true,
                IsDeleted = false,
                NameSurname=addressCRUDModel.NameSurname,
                Phone=addressCRUDModel.Phone
            };
            AppUserMapAddress appUserMapAddress = new AppUserMapAddress()
            {
                Address = address,
                CreateDate = DateTime.Now,
                IsActive = true,
                IsDeleted = false,
                AppUserId=appUser.AppUserId
            };
            appUserRepository.InsertAppUserMapAddress(appUserMapAddress);
            response = new Response()
            {
                Message = "Adres kaydı başırılı",
                Status = true,
                RedirectUrl = Url.Action("Index", "Address")
            };
            return Json(response);
        }
        public ActionResult Delete(int id)
        {
            AppUserMapAddress appUserMapAddress = appUserRepository.GetByUserMapAddress(id);
            appUserMapAddress.IsDeleted = true;
            appUserRepository.UpdateAppUserMapAddress(appUserMapAddress);
            return RedirectToAction("Index", "Address");
        }
        [HttpGet]
        public ActionResult Update(int id=0)
        {
            
            AddressCRUDModel addressCRUDModel = new AddressCRUDModel();
            AppUserMapAddress userMapAddress = appUserRepository.GetByUserMapAddress(id);
            Address address = userMapAddress.Address;
            if(address != null)
            {
                addressCRUDModel.AddressId = address.AddressId;
                addressCRUDModel.CityId = address.County.CityId;
                addressCRUDModel.CountyId = address.CountyId;
                addressCRUDModel.Explanation = address.Explanation;
                addressCRUDModel.NameSurname = address.NameSurname;
                addressCRUDModel.Phone = address.Phone;
                addressCRUDModel.Title = address.Title;
                return View(addressCRUDModel);

            }
            else
            {
                return RedirectToAction("Index", "Address");
            }
        }
        [HttpPost]
        public ActionResult Update(AddressCRUDModel addressCRUDModel)
        {
            Response response;
            AppUserMapAddress userMapAddress = appUserRepository.GetByUserMapAddress(addressCRUDModel.AddressId);
            Address address = userMapAddress.Address;
            if(address != null)
            {
                address.AddressId = addressCRUDModel.AddressId;
                address.County.CityId = addressCRUDModel.CityId;
                address.CountyId = addressCRUDModel.CountyId;
                address.Explanation = addressCRUDModel.Explanation;
                address.NameSurname = addressCRUDModel.NameSurname;
                address.Phone = addressCRUDModel.Phone;
                address.Title = addressCRUDModel.Title;
                response = new Response()
                {
                    Message = "Adres güncellendi",
                    RedirectUrl = Url.Action("Index", "Address"),
                    Status = true
                };
            }
            else
            {
                response = new Response()
                {
                    Message = "Adres güncellenemedi",
                    Status = false
                };
            }
            return Json(response);
        }

        public ActionResult GetAllCity(int id = 0)
        {
            List<County> countyList = cityCountyRepository.GetAllByCityId(id);
            SelectList listItems = new SelectList(countyList, "CountyId", "Name");
            return Json(listItems);
        }
    }
}