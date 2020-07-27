using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NTierDocker.Core;
using NTierDocker.Models;

namespace NTierDocker.Controllers
{
    public class HomeController : Controller
    {
        public Class1 myclass { get; set; }
        public HomeController()
        {
            myclass = new Class1();
        }
        public IActionResult Index()
        {
            var name = myclass.name;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
