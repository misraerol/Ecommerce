using ECommerce.BIZ.Repository.ProductManagement;
using ECommerce.BIZ.Repository.WishlistManagement;
using ECommerce.DATA;
using ECommerce.WEB.Models.WishlistManagement;
using ECommerce.WEB.Utility.Attribute;
using ECommerce.WEB.Utility.UIFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.WishlistManagement
{
    [LoggedUser]
    public class WishlistController : BaseController
    {
        WishlistRepository wishlistRepository;
       
        public WishlistController()
        {
            wishlistRepository = new WishlistRepository();
       
        }
        // GET: Wishlist
        public ActionResult Index()
        {

             List<AppUserWishlistModel> appUserMapWishes = new List<AppUserWishlistModel> ();
             List<AppUserMapWish> appUserMapWishList = wishlistRepository.GetAll();

             foreach (AppUserMapWish wish in appUserMapWishList)
             {
                 AppUserWishlistModel appUserWishlistModel = new AppUserWishlistModel()
                 {
                     Amount = wish.Product.Amount,
                     ProductName = wish.Product.Name,
                    ProductId=wish.Product.ProductId,
                    AppUserMapWishId=wish.AppUserMapWishId,
                 };

                 if (wish.Product.ProductMapImage != null)
                 {
                     ProductMapImage procImage = wish.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                     if (procImage != null)
                     {
                         appUserWishlistModel.ImagePath = procImage.ImagePath;
                     }
                     else
                     {
                         appUserWishlistModel.ImagePath = "notImage.jpg";
                     }
                 }
                 appUserMapWishes.Add(appUserWishlistModel);
             }
             return View(appUserMapWishes);
    
        }

        public ActionResult Add(int productId)
        {
            AppUser appUserSession = (AppUser)Session["LoggedUser"];
            //AppUserMapWish appUserwishlist = wishlistRepository.GetByProductId(productId);
            bool anyUseProductId = wishlistRepository.AnyProductId(productId);
            if (anyUseProductId)
            {
                return RedirectToAction("IndexProductStoreWindow", "Product");
            }
            else
            {
                AppUserMapWish appUserMapWish = new AppUserMapWish()
                {
                    AppUserId = appUserSession.AppUserId,
                    ProductId = productId,
                    IsActive = true,
                    IsDeleted = false,
                    CreateDate = DateTime.Now,

                };
                wishlistRepository.Insert(appUserMapWish);
                return RedirectToAction("IndexProductStoreWindow", "Product");
            }
           
        }
        public ActionResult Delete(int wishlistId)
        {

            AppUserMapWish wishlist = wishlistRepository.GetById(wishlistId);
            wishlist.IsActive = false;
            wishlistRepository.Update(wishlist);
            return RedirectToAction("Index", "Wishlist");
        }

        public PartialViewResult _WishList()
        {
            List<AppUserWishlistModel> appUserMapWishes = new List<AppUserWishlistModel>();
            List<AppUserMapWish> appUserMapWishList = wishlistRepository.GetAll();

            foreach (AppUserMapWish wish in appUserMapWishList)
            {
                AppUserWishlistModel appUserWishlistModel = new AppUserWishlistModel()
                {
                    Amount = wish.Product.Amount,
                    ProductName = wish.Product.ShortName,
                    ProductId = wish.Product.ProductId,
                    AppUserMapWishId = wish.AppUserMapWishId,
                };

                if (wish.Product.ProductMapImage != null)
                {
                    ProductMapImage procImage = wish.Product.ProductMapImage.Where(s => s.IsActive && !s.IsDeleted).Take(1).FirstOrDefault();
                    if (procImage != null)
                    {
                        appUserWishlistModel.ImagePath = procImage.ImagePath;
                    }
                    else
                    {
                        appUserWishlistModel.ImagePath = "notImage.jpg";
                    }
                }
                appUserMapWishes.Add(appUserWishlistModel);
            }
           
            return PartialView(appUserMapWishes);
        }

    }
}