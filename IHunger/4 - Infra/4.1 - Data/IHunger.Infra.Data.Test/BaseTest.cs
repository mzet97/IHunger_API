using IHunger.Infra.Data.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IHunger.Infra.Data.Test
{
    public class BaseTest : IDisposable
    {
        public ServiceProvider ServiceProvider { get; private set; }

        public BaseTest()
        {
            var serviceCollection = new ServiceCollection();

            serviceCollection.AddDbContext<DataIdentityDbContext>(o =>
                o.UseNpgsql($"Host=localhost;Port=5432;Pooling=true;Database=ihunger_test;User Id=postgres;Password=root;"),
                  ServiceLifetime.Transient
            );

            ServiceProvider = serviceCollection.BuildServiceProvider();
        }

        public void Dispose()
        {
            using (var context = ServiceProvider.GetService<DataIdentityDbContext>())
            {
                context.Dispose();
            }
        }
    }
}
