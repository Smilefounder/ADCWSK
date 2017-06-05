﻿using AutoMapper;
using Swastika.Extension.Blog.Application.ViewModels;
using Swastika.Extension.Blog.Domain.Commands;

namespace Swastika.Extension.Blog.Application.AutoMapper
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        public ViewModelToDomainMappingProfile()
        {
            CreateMap<BlogViewModel, RegisterNewBlogCommand>()
                .ConstructUsing(c => new RegisterNewBlogCommand(c.Name, c.Title,c.Slug,c.Description,c.CreatedUtc,c.ModifiedUtc,c.PublishedUtc,c.CreatedByUserId,c.CommonStatusId));
            CreateMap<BlogViewModel, UpdateBlogCommand>()
                .ConstructUsing(c => new UpdateBlogCommand(c.Id,c.Name, c.Title, c.Slug, c.Description, c.CreatedUtc, c.ModifiedUtc, c.PublishedUtc, c.CreatedByUserId, c.CommonStatusId));
        }
    }
}
