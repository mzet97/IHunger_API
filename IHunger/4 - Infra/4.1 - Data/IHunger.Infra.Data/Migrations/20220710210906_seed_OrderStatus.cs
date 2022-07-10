using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IHunger.Infra.Data.Migrations
{
    public partial class seed_OrderStatus : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("INSERT INTO public.\"OrdersStatus\" (\"Id\", \"Name\", \"Number\", \"CreatedAt\", \"UpdatedAt\") VALUES('E21A5B6F-6318-46E9-B39B-65D94D06A663', 'WaitingForPayment', 1, NOW(), NOW());");
            migrationBuilder.Sql("INSERT INTO public.\"OrdersStatus\" (\"Id\", \"Name\", \"Number\", \"CreatedAt\", \"UpdatedAt\") VALUES('D0E1C037-A1C1-40F1-B716-915E64C77B75', 'Paid', 2, NOW(), NOW());");
            migrationBuilder.Sql("INSERT INTO public.\"OrdersStatus\" (\"Id\", \"Name\", \"Number\", \"CreatedAt\", \"UpdatedAt\") VALUES('BB7E3FD5-279D-4B16-B76F-18142C02F57F', 'Preparing', 3, NOW(), NOW());");
            migrationBuilder.Sql("INSERT INTO public.\"OrdersStatus\" (\"Id\", \"Name\", \"Number\", \"CreatedAt\", \"UpdatedAt\") VALUES('766E24DF-81EF-4516-9B1F-4E00D8B3E886', 'OutForDelivery', 4, NOW(), NOW());");
            migrationBuilder.Sql("INSERT INTO public.\"OrdersStatus\" (\"Id\", \"Name\", \"Number\", \"CreatedAt\", \"UpdatedAt\") VALUES('2343FCC2-E4B8-42C2-9AF8-B79C7375C48D', 'Delivered', 5, NOW(), NOW());");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("DELETE FROM public.\"OrdersStatus\" WHERE \"Id\" = 'E21A5B6F-6318-46E9-B39B-65D94D06A663';");
            migrationBuilder.Sql("DELETE FROM public.\"OrdersStatus\" WHERE \"Id\" = 'D0E1C037-A1C1-40F1-B716-915E64C77B75';");
            migrationBuilder.Sql("DELETE FROM public.\"OrdersStatus\" WHERE \"Id\" = 'BB7E3FD5-279D-4B16-B76F-18142C02F57F';");
            migrationBuilder.Sql("DELETE FROM public.\"OrdersStatus\" WHERE \"Id\" = '766E24DF-81EF-4516-9B1F-4E00D8B3E886';");
            migrationBuilder.Sql("DELETE FROM public.\"OrdersStatus\" WHERE \"Id\" = '2343FCC2-E4B8-42C2-9AF8-B79C7375C48D';");
        }
    }
}
