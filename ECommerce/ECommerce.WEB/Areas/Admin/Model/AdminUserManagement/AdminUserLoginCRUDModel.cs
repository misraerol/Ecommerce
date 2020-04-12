﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.AdminUserManagement
{
    public class AdminUserLoginCRUDModel
    {
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }

        public bool IsRemember { get; set; }
    }
}