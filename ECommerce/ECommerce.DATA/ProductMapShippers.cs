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
    
    public partial class ProductMapShippers
    {
        public int ProductMapShippersId { get; set; }
        public int ProductId { get; set; }
        public int ShipperId { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual Shipper Shipper { get; set; }
    }
}