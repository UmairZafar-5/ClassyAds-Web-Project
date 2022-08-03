using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ClassyAds_Web_Project.Models;
using PagedList;
using System.IO;
using System.Web.Mvc;
using System.Dynamic;
using ClassyAds_Web_Project;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using Postal;
namespace ClassyAds_Web_Project.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        Sell_PkEntities db = new Sell_PkEntities();
        public ActionResult test()
        {
            return View();
        }

        public ActionResult sms()
        {
            //                   SMS Sending API
            string MyUsername = "username"; //Your Username At Sendpk.com 
            string MyPassword = "password"; //Your Password At Sendpk.com 
            string toNumber = "923440000000"; //Recepient cell phone number with country code 
            string Masking = /*"SMS Alert"*/"Sell.Pk"; //Your Company Brand Name 
            string MessageText = "SMS Sent using .Net";
            string jsonResponse = SendSMS(Masking, toNumber, MessageText, MyUsername, MyPassword);
            Console.Read(); //to keep console window open if trying in visual studio 
            ViewBag.error = jsonResponse;
            return View();
        }
        public static string SendSMS(string Masking, string toNumber, string MessageText, string MyUsername, string MyPassword)
        {
            String URI = "https://sendpk.com" +
            "/api/sms.php?" +
            "username=" + MyUsername +
            "&password=" + MyPassword +
            "&sender=" + Masking +
            "&mobile=" + toNumber +
            "&message=" + Uri.UnescapeDataString(MessageText); // Visual Studio 10-15 
            /*"//&message=" + System.Net.WebUtility.UrlEncode(MessageText);*/// Visual Studio 12 
            try
            {
                WebRequest req = WebRequest.Create(URI);
                WebResponse resp = req.GetResponse();
                var sr = new System.IO.StreamReader(resp.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                var httpWebResponse = ex.Response as HttpWebResponse;
                if (httpWebResponse != null)
                {
                    switch (httpWebResponse.StatusCode)
                    {
                        case HttpStatusCode.NotFound:
                            return "404:URL not found :" + URI;
                            break;
                        case HttpStatusCode.BadRequest:
                            return "400:Bad Request";
                            break;
                        default:
                            return httpWebResponse.StatusCode.ToString();
                    }
                }
            }
            return null;
        }
        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(FormCollection collection, HttpPostedFileBase file1)
        {
            string a = collection.Get("username"), b = collection.Get("email");
            tbl_User uu = db.tbl_User.Where(x => x.u_name == a).SingleOrDefault();
            tbl_User ue = db.tbl_User.Where(x => x.u_email == b).SingleOrDefault();
            if (uu != null)
            {
                Session["uu"] = uu;
                ViewBag.uu = "User Name Already Exist";
            }
            else if (ue != null)
            {
                Session["ue"] = ue;
                ViewBag.ue = "Email Already Exist";
            }
            else
            {
                tbl_User u = new tbl_User();
                string path1 = uploadingfile(file1);
                if (path1 == "-1")
                {
                    u.u_image = "~/Content/upload/user.png";
                }
                else
                {
                    u.u_image = path1;
                }
                u.u_name = collection.Get("username");
                u.u_email = collection.Get("email");
                u.u_password = collection.Get("pass");
                db.tbl_User.Add(u);
                db.SaveChanges();

                string c = collection.Get("email"), d = collection.Get("pass");
                tbl_User us = db.tbl_User.Where(x => x.u_email == c && x.u_password == d).SingleOrDefault();
                if (us != null)
                {
                    Session["u_id"] = us.u_id.ToString();
                    Session["u_name"] = us.u_name.ToString();
                    Session["u_image"] = us.u_image.ToString();
                    return RedirectToAction("Home");
                }
            }
            return View();
        }
        public ActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignIn(FormCollection collection)
        {
            string a = collection.Get("email"), b = collection.Get("password");
            tbl_User us = db.tbl_User.Where(x => x.u_email == a && x.u_password == b).SingleOrDefault();
            if (us != null)
            {
                Session["u_id"] = us.u_id.ToString();
                Session["u_name"] = us.u_name.ToString();
                Session["u_image"] = us.u_image.ToString();
                return RedirectToAction("Home");
            }
            else
            {
                ViewBag.error = "Wrong Email or password";
            }
            return View();
        }

        public ActionResult Home(int? page)
        {
            dynamic dy = new ExpandoObject();
            var list1 = db.tbl_Product.OrderByDescending(X => X.pro_id).ToList();
            var list2 = db.tbl_Category.OrderBy(X => X.cat_id).ToList();
            var list3 = db.tbl_product_no.ToList();
            var list4 = db.tbl_Product.OrderByDescending(X => X.pro_view).ToList();
            dy.pro1 = list1;
            dy.cat1 = list2;
            dy.p1 = list3;
            dy.l4 = list4;
            return View(dy);
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Remove("u_id");
            return RedirectToAction("Home");
        }
        public ActionResult PostAds()
        {
            if (Session["u_id"] == null)
            {
                return RedirectToAction("SignIn");
            }
            List<tbl_Category> li = db.tbl_Category.ToList();
            ViewBag.categorylist = new SelectList(li, "cat_id", "cat_name");
            return View();
        }
        [HttpPost]
        public ActionResult PostAds(FormCollection collection, tbl_Product pvm, HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {
            string path1, path2, path3;
            path1 = uploadingfile(file1);
            path2 = uploadingfile(file2);
            path3 = uploadingfile(file3);

            tbl_Product p = new tbl_Product();
            p.pro_name = collection.Get("name");
            p.pro_price = collection.Get("price");
            p.pro_contact = collection.Get("ph_no");
            p.pro_fk_cat = pvm.pro_fk_cat;
            p.pro_address = collection.Get("address");
            p.pro_des = collection.Get("desc");
            p.pro_image1 = path1;
            p.pro_image2 = path2;
            p.pro_image3 = path3;
            p.pro_fk_user = Convert.ToInt32(Session["u_id"]);
            p.pro_view = 0;
            db.tbl_Product.Add(p);
            db.SaveChanges();
            tbl_product_no n = db.tbl_product_no.Where(x => x.n_fk_cat == p.pro_fk_cat).SingleOrDefault();
            n.n_no = n.n_no + 1;
            db.SaveChanges();
            return RedirectToAction("PostAds");
        }
        public ActionResult ViewAds(int? page)
        {
            List<tbl_Category> li = db.tbl_Category.ToList();
            ViewBag.categorylist = new SelectList(li, "cat_id", "cat_name");

            dynamic dy = new ExpandoObject();
            var list1 = db.tbl_Product.OrderByDescending(X => X.pro_id).ToList();
            var list2 = db.tbl_Category.OrderBy(X => X.cat_id).ToList();
            var list3 = db.tbl_product_no.ToList();
            var list4 = db.tbl_Product.OrderByDescending(X => X.pro_view).ToList();
            int a = list1.Count;
            ViewBag.total = a + " Result found";
            dy.pro1 = list1;
            dy.cat1 = list2;
            dy.p1 = list3;
            dy.l4 = list4;
            var products = list1;
            var pageNumber = page ?? 1;
            var onePageOfProducts = products.ToPagedList(pageNumber, 10);
            ViewBag.OnePageOfProducts = onePageOfProducts;
            return View(dy);
        }
        [HttpPost]
        public ActionResult ViewAds(int? page, FormCollection collection)
        {
            int cat = Convert.ToInt32(collection.Get("cat"));
            string look = collection.Get("look");
            string loc = collection.Get("loc");
            dynamic dy = new ExpandoObject();
            var list1 = db.tbl_Product.ToList();
            if (cat != 0)
            {
                list1 = db.tbl_Product.Where(x => x.pro_name.Contains(look) && x.pro_address.Contains(loc) && x.pro_fk_cat == cat).OrderByDescending(X => X.pro_id).ToList();
            }
            else
            {
                list1 = db.tbl_Product.Where(x => x.pro_name.Contains(look) && x.pro_address.Contains(loc)).OrderByDescending(X => X.pro_id).ToList();
            }

            int a = list1.Count;
            ViewBag.total = a + " Result found";
            var list2 = db.tbl_Category.OrderBy(X => X.cat_id).ToList();
            var list3 = db.tbl_product_no.ToList();
            var list4 = db.tbl_Product.OrderByDescending(X => X.pro_view).ToList();
            dy.pro1 = list1;
            dy.cat1 = list2;
            dy.p1 = list3;
            dy.l4 = list4;
            var products = list1;
            var pageNumber = page ?? 1;
            var onePageOfProducts = products.ToPagedList(pageNumber, 10);
            ViewBag.OnePageOfProducts = onePageOfProducts;
            return View(dy);
        }

        public ActionResult DelAds(int? id)
        {
            tbl_Product p = db.tbl_Product.Where(x => x.pro_id == id).SingleOrDefault();
            string a, b, c;
            a = p.pro_image1.Substring(1);
            b = p.pro_image2.Substring(1);
            c = p.pro_image3.Substring(1);
            System.IO.File.Delete(Request.PhysicalApplicationPath + a);
            System.IO.File.Delete(Request.PhysicalApplicationPath + b);
            System.IO.File.Delete(Request.PhysicalApplicationPath + c);
            db.tbl_Product.Remove(p);
            db.SaveChanges();
            return RedirectToAction("Home");
        }
        public ActionResult Ads(int? id)
        {
            ads a = new ads();
            tbl_Product p = db.tbl_Product.Where(x => x.pro_id == id).SingleOrDefault();
            p.pro_view = p.pro_view + 1;
            db.SaveChanges();
            a.pro_id = p.pro_id;
            a.pro_name = p.pro_name;
            a.pro_price = p.pro_price;
            a.pro_des = p.pro_des;
            a.pro_view = p.pro_view;
            a.pro_address = p.pro_address;
            a.pro_image1 = p.pro_image1.Substring(1);
            a.pro_image2 = p.pro_image2.Substring(1);
            a.pro_image3 = p.pro_image3.Substring(1);
            a.pro_contact = p.pro_contact;
            a.Featured = p.Featured;
            a.pro_fk_user = p.pro_fk_user;
            tbl_Category c = db.tbl_Category.Where(x => x.cat_id == p.pro_fk_cat).SingleOrDefault();
            a.cat_name = c.cat_name;
            tbl_User u = db.tbl_User.Where(x => x.u_id == p.pro_fk_user).SingleOrDefault();
            a.u_name = u.u_name;
            a.u_image = u.u_image;
            return View(a);
        }
        public string uploadingfile(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {
                        path = Path.Combine(Server.MapPath("~/Content/upload"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/Content/upload/" + random + Path.GetFileName(file.FileName);
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>only jpg and png</script>");
                }
            }
            else
            {
                Response.Write("<script>select a file</script>");
                path = "-1";
            }
            return path;
        }
    }
}