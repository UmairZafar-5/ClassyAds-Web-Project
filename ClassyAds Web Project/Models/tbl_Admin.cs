//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClassyAds_Web_Project.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Admin
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Admin()
        {
            this.tbl_Category = new HashSet<tbl_Category>();
        }
    
        public int ad_id { get; set; }
        public string ad_name { get; set; }
        public string ad_email { get; set; }
        public string ad_password { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Category> tbl_Category { get; set; }
    }
}
