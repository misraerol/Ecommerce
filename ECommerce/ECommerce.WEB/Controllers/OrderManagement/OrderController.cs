using ECommerce.BIZ.Repository.AppUserManagement;
using ECommerce.BIZ.Repository.DiscountKeyManagement;
using ECommerce.BIZ.Repository.OrderManagement;
using ECommerce.BIZ.Repository.ParameterManagement;
using ECommerce.BIZ.Repository.ParameterTypeManagement;
using ECommerce.BIZ.Repository.UserCartManagament;
using ECommerce.CORE.Helper;
using ECommerce.DATA;
using ECommerce.WEB.Models.OrderManagement;
using ECommerce.WEB.Models.UserCartManagamenet;
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
        ParameterRepository parameterRepository;
        DiscountKeyRepository discountKeyRepository;
        public OrderController()
        {
            orderRepository = new OrderRepository();
            userCartRepository = new UserCartRepository();
            appUserRepository = new AppUserRepository();
            parameterRepository = new ParameterRepository();
            discountKeyRepository = new DiscountKeyRepository();
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
            List<Parameter> parameterList = parameterRepository.GetAllListByParameterTypeName(ParameterTypeList.PaymentType);
            orderModel.ParameterPayment = new SelectList(parameterList, "ParameterId", "Name");
            UserCartModel userCartModel = new UserCartModel();
            List<UserCart> userCartList = userCartRepository.GetAll();
            userCartModel.UserCartListModel = new List<UserCartListModel>();
            if (Session["DiscountRate"] != null)
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
            orderModel.UserCartModel = userCartModel;
            return View(orderModel);
        }

        [HttpPost]
        public ActionResult CheckOut(OrderModel orderModel)
        {
            AppUser appUser = (AppUser)Session["LoggedUser"];
            UserCartModel userCartModel = new UserCartModel();
            List<UserCart> userCartList = userCartRepository.GetAll();
            userCartModel.UserCartListModel = new List<UserCartListModel>();
            decimal totalAmount = 0;
            Order order = new Order()
            {
                AppUserId = appUser.AppUserId,
                IsActive = true,
                IsDeleted = false,
                AddressId = orderModel.AddressId,
                CreateDate = DateTime.Now,
                ParameterPaymentTypeId = orderModel.ParameterPaymentId

            };
            foreach (UserCart userCart in userCartList)
            {
                totalAmount += CalculateHelper.CalculateDiscountAmount(userCart.Product.DiscountRate, userCart.Product.Amount) * userCart.ProductCount;
            }
            if (Session["Discount"] == null)
            {

                order.TotalAmount = totalAmount;
            }
            else
            {
                DiscountKey discount = (DiscountKey)Session["Discount"];
                order.TotalAmount = CalculateHelper.CalculateDiscountAmount(discount.Discount.Value, totalAmount);
                order.DiscountKeyId = discount.DiscountKeyId;
                discount.IsActive = false;
                discount.IsDeleted = true;
                discountKeyRepository.Update(discount);
            }
            foreach (UserCart userCart in userCartList)
            {
                decimal productTotalAmount = CalculateHelper.CalculateDiscountAmount(userCart.Product.DiscountRate, userCart.Product.Amount) * userCart.ProductCount;
                byte ProductCount =(byte) userCart.ProductCount;

                OrderDetail orderDetail = new OrderDetail()
                {
                    IsActive = true,
                    IsDeleted = false,
                    Quantity = ProductCount,
                    Price = productTotalAmount,
                    ProductId = userCart.ProductId,
                    CreateDate = DateTime.Now,
                    ParameterRequiredFieldsId=userCart.ParameterProductRequiredTypesId
                };
                order.OrderDetail.Add(orderDetail);
            }
            orderRepository.Insert(order);
            userCartRepository.AllDelete(appUser.AppUserId);
            Session.Remove("Discount");
            Session.Remove("DiscountRate");
            return RedirectToAction("Success", "Order");

        }
        public ActionResult Success()
        {
            return View();
        }
    }
}