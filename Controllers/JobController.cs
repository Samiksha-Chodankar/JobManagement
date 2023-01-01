using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using JobManagement.Models;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace JobOpenings.Controllers
{
    public class JobController : ApiController
    {
        Job_ManagementEntities1 db = new Job_ManagementEntities1();
        //GET: Job
        [System.Web.Http.HttpGet]
        public IHttpActionResult Index()
        {
            IQueryable<Jobs> jobPositions = null;
            jobPositions = from job in db.JobPositions
                       join loc in db.Locations on job.LocationId equals loc.Id
                       join dpt in db.Departments on job.DepartmentId equals dpt.Id
                       select new Jobs
                        {
                            Id = job.Id,
                            Code = job.Code,
                            Title = job.Title,
                            Description = job.Description,
                           
                            location = new LocationData()
                            {
                                Id = loc.Id,
                                Title = loc.Title,
                                City = loc.City,
                                State=loc.State,
                                Country = loc.Country,
                                Zip = loc.Zipcode
                            },
                            Department= new DepartmentData()
                            {
                                Id=dpt.Id,
                                Title=dpt.Title
                            },
                            PostedDate = job.PostedDate,
                            ClosingDate = job.ClosingDate,
                       };

            var result= jobPositions.ToList();
            if (result.Count == 0)
            {
                return NotFound();
            }

            return Ok(result);
        }



        [System.Web.Http.HttpGet]
        public IHttpActionResult Index(int id)
        {
          
            IQueryable<Jobs> jobPositions = null;
            jobPositions = from job in db.JobPositions.Where(t=>t.Id==id)
                           join loc in db.Locations on job.LocationId equals loc.Id
                           join dpt in db.Departments on job.DepartmentId equals dpt.Id
                           select new Jobs
                           {
                               Id = job.Id,
                               Code = job.Code,
                               Title = job.Title,
                               Description = job.Description,

                               location = new LocationData()
                               {
                                   Id = loc.Id,
                                   Title=loc.Title,
                                   City=loc.City,
                                   State=loc.State,
                                   Country = loc.Country,
                                   Zip=loc.Zipcode
                               },
                               Department = new DepartmentData()
                               {
                                   Id = dpt.Id,
                                   Title = dpt.Title
                               },
                               PostedDate = job.PostedDate,
                               ClosingDate = job.ClosingDate,
                           };

            var result = jobPositions.ToList();
            if (result.Count == 0)
            {
                return NotFound();
            }

            return Ok(result);
        }


        [System.Web.Http.HttpPost]
        public IHttpActionResult JobInsert([FromBody] JobPosition e)
        {
            e.Code = "JOB-0" + e.Id;
            e.PostedDate = DateTime.Now;
            db.JobPositions.Add(e);
            db.SaveChanges();
            e.Code= "JOB-0" + e.Id;
            db.Entry(e).State = EntityState.Modified;
            db.SaveChanges();
           
            return Ok();
        }

       
      


        public void Put(int id, [FromBody] JobPosition e)
        {

            var entity = db.JobPositions.FirstOrDefault(t => t.Id == id);
            entity.Title = e.Title;
            entity.Description = e.Description;
            entity.LocationId = e.LocationId;
            entity.DepartmentId = e.DepartmentId;
            entity.ClosingDate = e.ClosingDate;
            db.Entry(entity).State = EntityState.Modified;
            db.SaveChanges();


        }
    }
}