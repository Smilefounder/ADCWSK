using System;
using Swastika.Domain.Core.Notifications;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Swastika.UI.Base.Controllers;
using Swastika.Extension.Blog.Application.Interfaces;
using Swastika.Extension.Blog.Application.ViewModels;

namespace Swastika.Extension.Blog.UI.Site.Controllers
{
    [Authorize]
    public class BlogController : BaseController
    {
        private readonly IBlogAppService _BlogAppService;

        public BlogController(IBlogAppService BlogAppService, IDomainNotificationHandler<DomainNotification> notifications) : base(notifications)
        {
            _BlogAppService = BlogAppService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Blog-management/list-all")]
        public IActionResult Index()
        {
            return View(_BlogAppService.GetAll());
        }

        //[HttpGet]
        //[AllowAnonymous]
        //[Route("Blog-management/Blog-details/{id:guid}")]
        //public IActionResult Details(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var BlogViewModel = _BlogAppService.GetById(id.Value);

        //    if (BlogViewModel == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(BlogViewModel);
        //}

        //[HttpGet]
        //[Authorize(Policy = "CanWriteBlogData")]
        //[Route("Blog-management/register-new")]
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[Authorize(Policy = "CanWriteBlogData")]
        //[Route("Blog-management/register-new")]
        //[ValidateAntiForgeryToken]
        //public IActionResult Create(BlogViewModel BlogViewModel)
        //{
        //    if (!ModelState.IsValid) return View(BlogViewModel);
        //    _BlogAppService.Register(BlogViewModel);

        //    if (IsValidOperation())
        //        ViewBag.Sucesso = "Blog Registered!";

        //    return View(BlogViewModel);
        //}
        
        //[HttpGet]
        //[Authorize(Policy = "CanWriteBlogData")]
        //[Route("Blog-management/edit-Blog/{id:guid}")]
        //public IActionResult Edit(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var BlogViewModel = _BlogAppService.GetById(id.Value);

        //    if (BlogViewModel == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(BlogViewModel);
        //}

        //[HttpPost]
        //[Authorize(Policy = "CanWriteBlogData")]
        //[Route("Blog-management/edit-Blog/{id:guid}")]
        //[ValidateAntiForgeryToken]
        //public IActionResult Edit(BlogViewModel BlogViewModel)
        //{
        //    if (!ModelState.IsValid) return View(BlogViewModel);

        //    _BlogAppService.Update(BlogViewModel);

        //    if (IsValidOperation())
        //        ViewBag.Sucesso = "Blog Updated!";

        //    return View(BlogViewModel);
        //}

        //[HttpGet]
        //[Authorize(Policy = "CanRemoveBlogData")]
        //[Route("Blog-management/remove-Blog/{id:guid}")]
        //public IActionResult Delete(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var BlogViewModel = _BlogAppService.GetById(id.Value);

        //    if (BlogViewModel == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(BlogViewModel);
        //}

        //[HttpPost, ActionName("Delete")]
        //[Authorize(Policy = "CanRemoveBlogData")]
        //[Route("Blog-management/remove-Blog/{id:guid}")]
        //[ValidateAntiForgeryToken]
        //public IActionResult DeleteConfirmed(Guid id)
        //{
        //    _BlogAppService.Remove(id);

        //    if (!IsValidOperation()) return View(_BlogAppService.GetById(id));

        //    ViewBag.Sucesso = "Blog Removed!";
        //    return RedirectToAction("Index");
        //}

        //[AllowAnonymous]
        //[Route("Blog-management/Blog-history/{id:guid}")]
        //public JsonResult History(Guid id)
        //{
        //    var BlogHistoryData = _BlogAppService.GetAllHistory(id);
        //    return Json(BlogHistoryData);
        //}
    }
}
