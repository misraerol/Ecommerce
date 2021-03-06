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
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.AppUserMapWish = new HashSet<AppUserMapWish>();
            this.OrderDetail = new HashSet<OrderDetail>();
            this.ProductMapImage = new HashSet<ProductMapImage>();
            this.ProductMapShippers = new HashSet<ProductMapShippers>();
            this.ProductMapRequiredFields = new HashSet<ProductMapRequiredFields>();
            this.ProductMapProperty = new HashSet<ProductMapProperty>();
            this.ProductMapComment = new HashSet<ProductMapComment>();
            this.ProductStoreWindow = new HashSet<ProductStoreWindow>();
            this.UserCart = new HashSet<UserCart>();
        }
    
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public string Explanation { get; set; }
        public decimal Amount { get; set; }
        public decimal DiscountRate { get; set; }
        public int CategoryId { get; set; }
        public Nullable<int> ParentId { get; set; }
        public bool IsShipperPay { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AppUserMapWish> AppUserMapWish { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMapImage> ProductMapImage { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMapShippers> ProductMapShippers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMapRequiredFields> ProductMapRequiredFields { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMapProperty> ProductMapProperty { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMapComment> ProductMapComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductStoreWindow> ProductStoreWindow { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserCart> UserCart { get; set; }
    }
}
