using JobManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace JobManagement.Controllers
{
    public class DepartmentController : ApiController
    {
        Job_ManagementEntities1 db = new Job_ManagementEntities1();

        [System.Web.Http.HttpGet]
        public IHttpActionResult Index()
        {
           
            List<DepartmentData> department = db.Departments.Select(t=> new DepartmentData { 
            Id=t.Id,
            Title=t.Title
            
            
            }).ToList();

           
            if (department.Count == 0)
            {
                return NotFound();
            }

            return Ok(department);
        }

        [System.Web.Http.HttpGet]
        public IHttpActionResult Index(int id)
        {
            List<DepartmentData> department = db.Departments.Where(t => t.Id == id).Select(t => new DepartmentData
            {
                Id = t.Id,
                Title = t.Title


            }).ToList();
          


            if (department.Count == 0)
            {
                return NotFound();
            }

            return Ok(department);
        }



        [System.Web.Http.HttpPost]
        public IHttpActionResult EmpInsert([FromBody] Department e)
        {
            db.Departments.Add(e);
            db.SaveChanges();
            return Ok();
        }
        public void Put(int id, [FromBody] Department e)
        {

            var entity = db.Departments.FirstOrDefault(t => t.Id == id);
            entity.Title = e.Title;
            db.Entry(entity).State = EntityState.Modified;
            db.SaveChanges();


        }
    }
}
