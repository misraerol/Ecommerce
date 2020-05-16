using ECommerce.BIZ.Repository.AppUserManagement;
using ECommerce.BIZ.Repository.OrderManagement;
using ECommerce.BIZ.Repository.UserCartManagament;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Models.OrderManagement;
using ECommerce.WEB.Utility.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.WEB.Controllers.OrderManagement
{
    [LoggedUser]
    public class OrderController : BaseController
    {
        OrderRepository orderRepository;
        UserCartRepository userCartRepository;
        AppUserRepository appUserRepository;
        public OrderController()
        {
            orderRepository = new OrderRepository();
            userCartRepository = new UserCartRepository();
            appUserRepository = new AppUserRepository();
        }
        // GET: Order
        public ActionResult Index()
        {


            return View();
        }
        [HttpGet]
        public ActionResult CheckOut()
        {
            AppUser appUser = (AppUser)Session["LoggedUser"];
            
            OrderModel orderModel = new OrderModel();
            List<Address> addressList = appUserRepository.GetAllAddress(appUser.AppUserId);
            orderModel.AddressList = new SelectList(addressList, "AddressId", "Title");


        }

        [HttpPost]
        public ActionResult CheckOut()
        {
            AppUser appUser = (AppUser)Session["LoggedUser"];
            if (appUser != null)
            {
                List<UserCart> userCartList = userCartRepository.GetAll();
                decimal totalAmount = 0;
                Order order = new Order()
                {
                    AppUserId = appUser.AppUserId,
                    IsActive = true,
                    IsDeleted = false,
                };
                foreach (UserCart userCart in userCartList)
                {
                    totalAmount += CalculateHelper.CalculateDiscountAmount(userCart.Product.DiscountRate, userCart.Product.Amount) * userCart.ProductCount;
                }
                order.TotalAmount = totalAmount;
                foreach (UserCart userCart in userCartList)
                {
                    decimal productTotalAmount = CalculateHelper.CalculateDiscountAmount(userCart.Product.DiscountRate, userCart.Product.Amount) * userCart.ProductCount;
                    byte ProductCount = System.Convert.ToByte(userCart.ProductCount);

                    OrderDetail orderDetail = new OrderDetail()
                    {
                        IsActive = true,
                        IsDeleted = false,
                        Quantity = ProductCount,
                        Price = productTotalAmount,
                        ProductId = userCart.ProductId,
                    };
                    order.OrderDetail.Add(orderDetail);
                }
                orderRepository.Insert(order);
                userCartRepository.AllDelete(appUser.AppUserId);
                return RedirectToAction("Success", "Order");
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}