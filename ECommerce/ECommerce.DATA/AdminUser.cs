//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ECommerce.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class AdminUser
    {
        public int AdminUserId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public Nullable<bool> IsActivation { get; set; }
        public string ActivationCode { get; set; }
    }
}
