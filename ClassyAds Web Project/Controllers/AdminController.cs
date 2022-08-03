using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ClassyAds_Web_Project.Models;
using PagedList;
using System.IO;

namespace ClassyAds_Web_Project.Controllers
{
    public class AdminController : Controller
    {
        Sell_PkEntities db = new Sell_PkEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(tbl_Admin avm)
        {
            tbl_Admin ad = db.tbl_Admin.Where(x => x.ad_email == avm.ad_email && x.ad_password == avm.ad_password).SingleOrDefault();
            if (ad != null)
            {
                Session["ad_id"] = ad.ad_id.ToString();
                return RedirectToAction("AddCategory");
            }
            else
            {
                ViewBag.error = "Invalid User";
            }
            return View();
        }
        [HttpGet]
        public ActionResult AddCategory()
        {
            //if (Session["ad_id"] == null)
            //{
            //    return RedirectToAction("Login");
            //}
            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(tbl_Category cvm, HttpPostedFileBase imgfile)
        {
            string path = uploadingfile(imgfile);
            ViewBag.error = "Image could not be uploaded";
            if (path == "-1")
            {
                ViewBag.error = "Image could not be uploaded";
            }
            else
            {
                tbl_Category cat = new tbl_Category();
                cat.cat_name = cvm.cat_name;
                cat.cat_image = path;
                cat.cat_view = 0;
                //cat.cat_fk_ad = 1; /*Convert.ToInt32(Session["ad_id"].ToString());*/
                db.tbl_Category.Add(cat);
                db.SaveChanges();
                return RedirectToAction("AddCategory");
            }
            return View();
        }
        public ActionResult ViewCategory(int? page)
        {
            //if (Session["ad_id"] == null)
            //{
            //    return RedirectToAction("Login");
            //}
            int pagesize = 9, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.tbl_Category.Where(x => true).OrderByDescending(X => X.cat_id).ToList();
            IPagedList<tbl_Category> stu = list.ToPagedList(pageindex, pagesize);
            return View(stu);
        }

        public ActionResult DeleteCategory(int? id)
        {
            tbl_Category cat = db.tbl_Category.Where(x => x.cat_id == id).SingleOrDefault();
            db.tbl_Category.Remove(cat);
            db.SaveChanges();
            return RedirectToAction("ViewCategory");
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
                        path = Path.Combine(Server.MapPath("~/Content/upload/"), random + Path.GetFileName(file.FileName));
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