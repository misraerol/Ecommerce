using ECommerce.BIZ.Repository.DiscountKeyManagement;
using ECommerce.BIZ.Repository.UserCartManagament;
using ECommerce.DATA;
using ECommerce.WEB.Models.UserCartManagamenet;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.UserCartManagement
{
    [LoggedUser]
    public class UserCartController : BaseController
    {
        UserCartRepository userCartRepository;
        DiscountKeyRepository discountKeyRepository;
        public UserCartController()
        {
            userCartRepository = new UserCartRepository();
            discountKeyRepository = new DiscountKeyRepository();
        }
        // GET: UserCart
        public ActionResult Index()
        {
            UserCartModel userCartModel = new UserCartModel();
            List<UserCart> userCartList = userCartRepository.GetAll();
            userCartModel.UserCartListModel = new List<UserCartListModel>();
            if(Session["DiscountRate"] != null)
            {
                userCartModel.DiscountRate = (decimal)Session["DiscountRate"];
                userCartModel.IsHaveCupon = true;
            }
            foreach (UserCart userCart in userCartList)
            {
                UserCartListModel userCartListModel = new UserCartListModel()
                {
                    Amount = userCart.Product.Amount,
                    ProductId = userCart.Product.ProductId,
                    ProductName = userCart.Product.Name,
                    UserCartId = userCart.UserCartId,
                    ProductCount = userCart.ProductCount,
                    DiscountRate = userCart.Product.DiscountRate
                };
                if (userCart.Product.ProductMapImage != null)
                {
                    ProductMapImage productMap = userCart.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();

                    if (productMap != null)
                    {
                        userCartListModel.ImagePath = productMap.ImagePath;
                    }
                    else
                    {
                        userCartListModel.ImagePath = "notImage.jpg";
                    }
                }
                userCartModel.UserCartListModel.Add(userCartListModel);
            }
            return View(userCartModel);
        }

        public ActionResult Add(int? ProductMapRequiredFieldId, int productId = 0, int quantity = 1)
        {
            AppUser appUser = (AppUser)Session["LoggedUser"];
            UserCart userCart = userCartRepository.GetByProductId(productId);
            if (userCart != null)
            {
                userCart.ProductCount += 1;
                userCartRepository.Update(userCart);

            }
            else
            {
                UserCart userCarts = new UserCart()
                {
                    ProductCount = quantity,
                    AppUserId = appUser.AppUserId,
                    CreateDate = DateTime.Now,
                    IsActive = true,
                    IsDeleted = false,
                    ProductId = productId,
                    ParameterProductRequiredTypesId = ProductMapRequiredFieldId
                };

                userCartRepository.Insert(userCarts);
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Decrease(int userCartId)
        {
            UserCart userCart = userCartRepository.GetById(userCartId);
            if (userCart.ProductCount > 1)
            {
                userCartRepository.DecreaseByUserCartId(userCartId);
            }
            else
            {
                userCart.IsActive = false;
                userCart.IsDeleted = true;
                userCartRepository.Update(userCart);
            }
            return RedirectToAction("Index", "UserCart");

        }

        public ActionResult Increase(int userCartId)
        {

            userCartRepository.IncreaseByUserCartId(userCartId);
            return RedirectToAction("Index", "UserCart");
        }

        public ActionResult Delete(int userCartId = 0)
        {
            UserCart userCart = userCartRepository.GetById(userCartId);
            userCart.IsActive = false;
            userCart.IsDeleted = true;
            userCartRepository.Update(userCart);
            return RedirectToAction("Index", "UserCart");
        }

        public PartialViewResult _UserCart()
        {
            UserCartModel userCartModel = new UserCartModel();
            List<UserCart> userCartList = userCartRepository.GetAll();
            userCartModel.UserCartListModel = new List<UserCartListModel>();
            foreach (UserCart userCart in userCartList)
            {
                UserCartListModel userCartListModel = new UserCartListModel()
                {
                    Amount = userCart.Product.Amount,
                    ProductId = userCart.Product.ProductId,
                    ProductName = userCart.Product.ShortName,
                    UserCartId = userCart.UserCartId,
                    ProductCount = userCart.ProductCount,
                    DiscountRate = userCart.Product.DiscountRate
                };
                if (userCart.Product.ProductMapImage != null)
                {
                    ProductMapImage productMap = userCart.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();

                    if (productMap != null)
                    {
                        userCartListModel.ImagePath = productMap.ImagePath;
                    }
                    else
                    {
                        userCartListModel.ImagePath = "notImage.jpg";
                    }
                }
                userCartModel.UserCartListModel.Add(userCartListModel);
            }
            return PartialView(userCartModel);
        }


        public ActionResult AddCupon(string cupon)
        {
            DiscountKey discountKey = discountKeyRepository.GetFindDiscountKey(cupon);
            if (discountKey != null)
            {
                if (discountKey.ExpiredDate >= DateTime.Now || discountKey.ExpiredDate == null)
                {
                    Session.Add("DiscountRate", discountKey.Discount);
                    Session.Add("Discount", discountKey);
                }
            }
            return RedirectToAction("Index", "UserCart");
        }
        
        public ActionResult RemoveCupon()
        {
            Session.Remove("DiscountRate");
            Session.Remove("Discount");
            return RedirectToAction("Index", "UserCart");
        }

    }
}