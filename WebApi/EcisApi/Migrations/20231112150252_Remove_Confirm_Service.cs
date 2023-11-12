using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EcisApi.Migrations
{
    public partial class Remove_Confirm_Service : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "VerificationConfirmDocument");

            migrationBuilder.DropTable(
                name: "VerificationConfirmRequirement");

            migrationBuilder.AddColumn<int>(
                name: "SubmittedCount",
                table: "VerificationProcess",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SubmittedCount",
                table: "VerificationProcess");

            migrationBuilder.CreateTable(
                name: "VerificationConfirmRequirement",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AnnounceAgentDocumentContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AnnouncedAgentAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AnnouncedCompanyAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AssignedAgentId = table.Column<int>(type: "int", nullable: true),
                    ConfirmCompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    ConfirmDocumentContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConfirmedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    ScheduledLocation = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ScheduledTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    VerificationCriteriaId = table.Column<int>(type: "int", nullable: true),
                    VerificationProcessId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationConfirmRequirement", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationConfirmRequirement_Agent_AssignedAgentId",
                        column: x => x.AssignedAgentId,
                        principalTable: "Agent",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationConfirmRequirement_CompanyType_ConfirmCompanyTypeId",
                        column: x => x.ConfirmCompanyTypeId,
                        principalTable: "CompanyType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationConfirmRequirement_VerificationCriteria_VerificationCriteriaId",
                        column: x => x.VerificationCriteriaId,
                        principalTable: "VerificationCriteria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationConfirmRequirement_VerificationProcess_VerificationProcessId",
                        column: x => x.VerificationProcessId,
                        principalTable: "VerificationProcess",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VerificationConfirmDocument",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DocumentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentSize = table.Column<long>(type: "bigint", nullable: false),
                    DocumentType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    VerificationConfirmRequirementId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationConfirmDocument", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationConfirmDocument_VerificationConfirmRequirement_VerificationConfirmRequirementId",
                        column: x => x.VerificationConfirmRequirementId,
                        principalTable: "VerificationConfirmRequirement",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_VerificationConfirmDocument_VerificationConfirmRequirementId",
                table: "VerificationConfirmDocument",
                column: "VerificationConfirmRequirementId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationConfirmRequirement_AssignedAgentId",
                table: "VerificationConfirmRequirement",
                column: "AssignedAgentId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationConfirmRequirement_ConfirmCompanyTypeId",
                table: "VerificationConfirmRequirement",
                column: "ConfirmCompanyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationConfirmRequirement_VerificationCriteriaId",
                table: "VerificationConfirmRequirement",
                column: "VerificationCriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationConfirmRequirement_VerificationProcessId",
                table: "VerificationConfirmRequirement",
                column: "VerificationProcessId");
        }
    }
}
