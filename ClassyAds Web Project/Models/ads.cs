using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClassyAds_Web_Project.Models
{
    public class ads
    {
        public int pro_id { get; set; }
        public string pro_name { get; set; }
        public string pro_des { get; set; }
        public Nullable<int> pro_view { get; set; }
        public string pro_address { get; set; }
        public string pro_image1 { get; set; }
        public string pro_image2 { get; set; }
        public string pro_image3 { get; set; }
        public Nullable<int> pro_fk_user { get; set; }
        public Nullable<int> pro_fk_cat { get; set; }
        public string pro_contact { get; set; }
        public string pro_price { get; set; }
        public Nullable<bool> Featured { get; set; }
        public Nullable<bool> Popular_Products { get; set; }
        public string cat_name { get; set; }
        public string u_name { get; set; }
        public string u_image { get; set; }
    }
}