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
    
    public partial class ProductMapComment
    {
        public int ProductMapCommentId { get; set; }
        public int ProductId { get; set; }
        public int AppUserId { get; set; }
        public string Comment { get; set; }
        public byte Star { get; set; }
        public bool IsApproved { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual AppUser AppUser { get; set; }
        public virtual Product Product { get; set; }
    }
}
