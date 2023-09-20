using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace IHunger.Infra.Data.Migrations
{
    public partial class UpdateImageSize : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Image",
                schema: "public",
                table: "Restaurant",
                type: "varchar(10000)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(100)");

            migrationBuilder.AlterColumn<string>(
                name: "Image",
                schema: "public",
                table: "Products",
                type: "varchar(10000)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(100)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Image",
                schema: "public",
                table: "Restaurant",
                type: "varchar(100)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(10000)");

            migrationBuilder.AlterColumn<string>(
                name: "Image",
                schema: "public",
                table: "Products",
                type: "varchar(100)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(10000)");
        }
    }
}
