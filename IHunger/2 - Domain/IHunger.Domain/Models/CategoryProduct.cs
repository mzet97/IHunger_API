using IHunger.Domain.Models.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace IHunger.Domain.Models
{
    public class CategoryProduct : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public CategoryProduct()
        {

        }

        public CategoryProduct(Guid id, string name, string description, DateTime createdAt)
        {
            Id = id;
            Name = name;
            Description = description;
            CreatedAt = createdAt;
        }

        public bool IsValid()
        {
            var validationResult = new CategoryProductValidation().Validate(this);
            return validationResult.IsValid;
        }
    }
}
