﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ECommerce.WEB.Areas.Admin.Model.ParameterManagement
{
    public class ParameterCRUDModel
    {
        public int ParameterId { get; set; }

        [Required]
        public string Name { get; set; }
    }
}