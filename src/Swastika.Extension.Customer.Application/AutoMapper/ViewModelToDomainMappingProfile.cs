﻿using AutoMapper;
using Swastika.Extension.Customer.Application.ViewModels;
using Swastika.Extension.Customer.Domain.Commands;

namespace Swastika.Extension.Customer.Application.AutoMapper
{
    public class ViewModelToDomainMappingProfile : Profile
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ViewModelToDomainMappingProfile" /> class.
        /// </summary>
        public ViewModelToDomainMappingProfile()
        {
            CreateMap<CustomerViewModel, RegisterNewCustomerCommand>()
                .ConstructUsing(c => new RegisterNewCustomerCommand(c.Name, c.Email, c.BirthDate));
            CreateMap<CustomerViewModel, UpdateCustomerCommand>()
                .ConstructUsing(c => new UpdateCustomerCommand(c.Id, c.Name, c.Email, c.BirthDate));
        }
    }
}
