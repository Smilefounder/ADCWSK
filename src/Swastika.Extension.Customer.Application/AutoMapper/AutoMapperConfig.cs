﻿using AutoMapper;

namespace Swastika.Extension.Customer.Application.AutoMapper
{
    public class AutoMapperConfig
    {

        /// <summary>
        /// Registers the mappings.
        /// </summary>
        /// <returns></returns>
        public static MapperConfiguration RegisterMappings()
        {
            return new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new DomainToViewModelMappingProfile());
                cfg.AddProfile(new ViewModelToDomainMappingProfile());
            });
        }
    }
}
