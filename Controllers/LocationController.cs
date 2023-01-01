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
    public class LocationController : ApiController
    {
        Job_ManagementEntities1 db = new Job_ManagementEntities1();

        [System.Web.Http.HttpGet]
        public IHttpActionResult Index()
        {

            List<LocationData> location = db.Locations.Select(t=> new LocationData { 
              Id=t.Id,
              City=t.City,
              Country=t.Country,
              Zip=t.Zipcode
            
            
            }).ToList();


            if (location.Count == 0)
            {
                return NotFound();
            }

            return Ok(location);
        }

        [System.Web.Http.HttpGet]
        public IHttpActionResult Index(int id)
        {

            List<Location> location = db.Locations.Where(t => t.Id == id).ToList();


            if (location.Count == 0)
            {
                return NotFound();
            }

            return Ok(location);
        }



        [System.Web.Http.HttpPost]
        public IHttpActionResult LocationInsert([FromBody] Location e)
        {
            db.Locations.Add(e);
            db.SaveChanges();
            return Ok();
        }
        public void Put(int id, [FromBody] Location e)
        {

            var entity = db.Locations.FirstOrDefault(t => t.Id == id);
            entity.Title = e.Title;
            entity.Country = e.Country;
            entity.Zipcode = e.Zipcode;
            entity.City = e.City;
            db.Entry(entity).State = EntityState.Modified;
            db.SaveChanges();


        }
    }
}
