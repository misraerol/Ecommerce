using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.AdminUserManagement
{
    public class AdminUserListViewModel
    {
        public int AdminUserId { get; set; }
        public string Email { get; set; }
        public DateTime CreateDate { get; set; }
    }
}