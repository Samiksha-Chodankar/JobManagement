using JobManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JobManagement.Models
{

    public class Jobs
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        
        public System.DateTime PostedDate { get; set; }
        public System.DateTime ClosingDate { get; set; }

        public LocationData location { get; set; }
        public DepartmentData Department { get; set; }

    }

    public class LocationData
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string Zip { get; set; }
    }
    
    public class DepartmentData
    {
        public int Id { get; set; }
        public string Title { get; set; }
    }
}