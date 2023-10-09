using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EcisApi.Migrations
{
    public partial class Refesh : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CompanyReportTypes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TypeName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompanyReportTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CompanyType",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TypeName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompanyType", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CriteriaType",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CriteriaTypeName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CriteriaType", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Province",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProvinceCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ProvinceName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Province", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HasManagement = table.Column<bool>(type: "bit", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Role", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SystemConfiguration",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ConfigurationKey = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConfigurationValue = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SystemConfiguration", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Criteria",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CriteriaName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CriteriaTypeId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Criteria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Criteria_CriteriaType_CriteriaTypeId",
                        column: x => x.CriteriaTypeId,
                        principalTable: "CriteriaType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Account",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsVerified = table.Column<bool>(type: "bit", nullable: false),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Account", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Account_Role_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CriteriaDetail",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CriteriaDetailName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsRequired = table.Column<bool>(type: "bit", nullable: true),
                    CriteriaId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CriteriaDetail", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CriteriaDetail_Criteria_CriteriaId",
                        column: x => x.CriteriaId,
                        principalTable: "Criteria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Agent",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DateOfBirth = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Agent", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Agent_Account_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Account",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Company",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CompanyNameVI = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CompanyNameEN = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CompanyCode = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    LogoUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    CompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    ProvinceId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Company", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Company_Account_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Account",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Company_CompanyType_CompanyTypeId",
                        column: x => x.CompanyTypeId,
                        principalTable: "CompanyType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Company_Province_ProvinceId",
                        column: x => x.ProvinceId,
                        principalTable: "Province",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ThirdParty",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClientId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClientSecret = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    AccountId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ThirdParty", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ThirdParty_Account_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Account",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AgentAssignment",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AgentId = table.Column<int>(type: "int", nullable: false),
                    ProvinceId = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AgentAssignment", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AgentAssignment_Agent_AgentId",
                        column: x => x.AgentId,
                        principalTable: "Agent",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AgentAssignment_Province_ProvinceId",
                        column: x => x.ProvinceId,
                        principalTable: "Province",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "VerificationProcess",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SubmitDeadline = table.Column<DateTime>(type: "datetime2", nullable: true),
                    SubmittedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ReviewedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    FinishedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ValidFrom = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ValidTo = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsOpenedByAgent = table.Column<bool>(type: "bit", nullable: false),
                    IsSubmitted = table.Column<bool>(type: "bit", nullable: false),
                    IsReviewed = table.Column<bool>(type: "bit", nullable: false),
                    IsFinished = table.Column<bool>(type: "bit", nullable: false),
                    SubmitMethod = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    AssignedAgentId = table.Column<int>(type: "int", nullable: true),
                    CompanyId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationProcess", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationProcess_Agent_AssignedAgentId",
                        column: x => x.AssignedAgentId,
                        principalTable: "Agent",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationProcess_Company_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationProcess_CompanyType_CompanyTypeId",
                        column: x => x.CompanyTypeId,
                        principalTable: "CompanyType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ViolationReport",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ApprovedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CompanyId = table.Column<int>(type: "int", nullable: true),
                    ReportAgentId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ViolationReport", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ViolationReport_Agent_ReportAgentId",
                        column: x => x.ReportAgentId,
                        principalTable: "Agent",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ViolationReport_Company_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CompanyReport",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ActionTitle = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AcceptedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    HandledAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    IsHandled = table.Column<bool>(type: "bit", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    VerificationProcessId = table.Column<int>(type: "int", nullable: true),
                    CompanyReportTypeId = table.Column<int>(type: "int", nullable: true),
                    TargetedCompanyId = table.Column<int>(type: "int", nullable: true),
                    CreatorCompanyId = table.Column<int>(type: "int", nullable: true),
                    AssignedAgentId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompanyReport", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CompanyReport_Agent_AssignedAgentId",
                        column: x => x.AssignedAgentId,
                        principalTable: "Agent",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyReport_Company_CreatorCompanyId",
                        column: x => x.CreatorCompanyId,
                        principalTable: "Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyReport_Company_TargetedCompanyId",
                        column: x => x.TargetedCompanyId,
                        principalTable: "Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyReport_CompanyReportTypes_CompanyReportTypeId",
                        column: x => x.CompanyReportTypeId,
                        principalTable: "CompanyReportTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyReport_VerificationProcess_VerificationProcessId",
                        column: x => x.VerificationProcessId,
                        principalTable: "VerificationProcess",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VerificationCriteria",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ApprovedStatus = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CompanyRate = table.Column<bool>(type: "bit", nullable: true),
                    CompanyOpinion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ReviewResult = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ReviewComment = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VerificationProcessId = table.Column<int>(type: "int", nullable: true),
                    CriteriaDetailId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationCriteria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationCriteria_CriteriaDetail_CriteriaDetailId",
                        column: x => x.CriteriaDetailId,
                        principalTable: "CriteriaDetail",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_VerificationCriteria_VerificationProcess_VerificationProcessId",
                        column: x => x.VerificationProcessId,
                        principalTable: "VerificationProcess",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ViolationReportDocument",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DocumentType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentSize = table.Column<long>(type: "bigint", nullable: false),
                    ViolationReportId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ViolationReportDocument", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ViolationReportDocument_ViolationReport_ViolationReportId",
                        column: x => x.ViolationReportId,
                        principalTable: "ViolationReport",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CompanyReportDocument",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DocumentType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentSize = table.Column<long>(type: "bigint", nullable: false),
                    CompanyReportId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompanyReportDocument", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CompanyReportDocument_CompanyReport_CompanyReportId",
                        column: x => x.CompanyReportId,
                        principalTable: "CompanyReport",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "CompanyTypeModification",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Modification = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsAnnounced = table.Column<bool>(type: "bit", nullable: false),
                    AnnouncedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CompanyId = table.Column<int>(type: "int", nullable: true),
                    PreviousCompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    UpdatedCompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    VerificationProcessId = table.Column<int>(type: "int", nullable: true),
                    ViolationReportId = table.Column<int>(type: "int", nullable: true),
                    CompanyReportId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompanyTypeModification", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_Company_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_CompanyReport_CompanyReportId",
                        column: x => x.CompanyReportId,
                        principalTable: "CompanyReport",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_CompanyType_PreviousCompanyTypeId",
                        column: x => x.PreviousCompanyTypeId,
                        principalTable: "CompanyType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_CompanyType_UpdatedCompanyTypeId",
                        column: x => x.UpdatedCompanyTypeId,
                        principalTable: "CompanyType",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_VerificationProcess_VerificationProcessId",
                        column: x => x.VerificationProcessId,
                        principalTable: "VerificationProcess",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_CompanyTypeModification_ViolationReport_ViolationReportId",
                        column: x => x.ViolationReportId,
                        principalTable: "ViolationReport",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VerificationConfirmRequirement",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ScheduledTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ScheduledLocation = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AnnouncedAgentAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AnnouncedCompanyAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ConfirmedAt = table.Column<DateTime>(type: "datetime2", nullable: true),
                    AnnounceAgentDocumentContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConfirmDocumentContent = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VerificationProcessId = table.Column<int>(type: "int", nullable: true),
                    AssignedAgentId = table.Column<int>(type: "int", nullable: true),
                    ConfirmCompanyTypeId = table.Column<int>(type: "int", nullable: true),
                    VerificationCriteriaId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
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
                name: "VerificationDocument",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ResourceType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ResourceUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ResourceSize = table.Column<long>(type: "bigint", nullable: false),
                    UploaderType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    VerificationCriteriaId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VerificationDocument", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VerificationDocument_VerificationCriteria_VerificationCriteriaId",
                        column: x => x.VerificationCriteriaId,
                        principalTable: "VerificationCriteria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VerificationConfirmDocument",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DocumentType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DocumentSize = table.Column<long>(type: "bigint", nullable: false),
                    VerificationConfirmRequirementId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
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

            migrationBuilder.CreateTable(
                name: "DocumentReview",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsAccepted = table.Column<bool>(type: "bit", nullable: false),
                    VerificationDocumentId = table.Column<int>(type: "int", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DocumentReview", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DocumentReview_VerificationDocument_VerificationDocumentId",
                        column: x => x.VerificationDocumentId,
                        principalTable: "VerificationDocument",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Account_Email",
                table: "Account",
                column: "Email");

            migrationBuilder.CreateIndex(
                name: "IX_Account_RoleId",
                table: "Account",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_Agent_AccountId",
                table: "Agent",
                column: "AccountId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AgentAssignment_AgentId",
                table: "AgentAssignment",
                column: "AgentId");

            migrationBuilder.CreateIndex(
                name: "IX_AgentAssignment_ProvinceId",
                table: "AgentAssignment",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_Company_AccountId",
                table: "Company",
                column: "AccountId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Company_CompanyCode",
                table: "Company",
                column: "CompanyCode");

            migrationBuilder.CreateIndex(
                name: "IX_Company_CompanyTypeId",
                table: "Company",
                column: "CompanyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_Company_ProvinceId",
                table: "Company",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_AssignedAgentId",
                table: "CompanyReport",
                column: "AssignedAgentId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_CompanyReportTypeId",
                table: "CompanyReport",
                column: "CompanyReportTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_CreatorCompanyId",
                table: "CompanyReport",
                column: "CreatorCompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_Status_IsDeleted",
                table: "CompanyReport",
                columns: new[] { "Status", "IsDeleted" });

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_TargetedCompanyId",
                table: "CompanyReport",
                column: "TargetedCompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReport_VerificationProcessId",
                table: "CompanyReport",
                column: "VerificationProcessId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyReportDocument_CompanyReportId",
                table: "CompanyReportDocument",
                column: "CompanyReportId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_CompanyId",
                table: "CompanyTypeModification",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_CompanyReportId",
                table: "CompanyTypeModification",
                column: "CompanyReportId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_PreviousCompanyTypeId",
                table: "CompanyTypeModification",
                column: "PreviousCompanyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_UpdatedCompanyTypeId",
                table: "CompanyTypeModification",
                column: "UpdatedCompanyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_VerificationProcessId",
                table: "CompanyTypeModification",
                column: "VerificationProcessId");

            migrationBuilder.CreateIndex(
                name: "IX_CompanyTypeModification_ViolationReportId",
                table: "CompanyTypeModification",
                column: "ViolationReportId");

            migrationBuilder.CreateIndex(
                name: "IX_Criteria_CriteriaTypeId",
                table: "Criteria",
                column: "CriteriaTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_CriteriaDetail_CriteriaId",
                table: "CriteriaDetail",
                column: "CriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_DocumentReview_VerificationDocumentId",
                table: "DocumentReview",
                column: "VerificationDocumentId");

            migrationBuilder.CreateIndex(
                name: "IX_ThirdParty_AccountId",
                table: "ThirdParty",
                column: "AccountId",
                unique: true);

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

            migrationBuilder.CreateIndex(
                name: "IX_VerificationCriteria_CriteriaDetailId",
                table: "VerificationCriteria",
                column: "CriteriaDetailId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationCriteria_VerificationProcessId",
                table: "VerificationCriteria",
                column: "VerificationProcessId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationDocument_VerificationCriteriaId",
                table: "VerificationDocument",
                column: "VerificationCriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationProcess_AssignedAgentId",
                table: "VerificationProcess",
                column: "AssignedAgentId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationProcess_CompanyId",
                table: "VerificationProcess",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_VerificationProcess_CompanyTypeId",
                table: "VerificationProcess",
                column: "CompanyTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_ViolationReport_CompanyId",
                table: "ViolationReport",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_ViolationReport_ReportAgentId",
                table: "ViolationReport",
                column: "ReportAgentId");

            migrationBuilder.CreateIndex(
                name: "IX_ViolationReportDocument_ViolationReportId",
                table: "ViolationReportDocument",
                column: "ViolationReportId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AgentAssignment");

            migrationBuilder.DropTable(
                name: "CompanyReportDocument");

            migrationBuilder.DropTable(
                name: "CompanyTypeModification");

            migrationBuilder.DropTable(
                name: "DocumentReview");

            migrationBuilder.DropTable(
                name: "SystemConfiguration");

            migrationBuilder.DropTable(
                name: "ThirdParty");

            migrationBuilder.DropTable(
                name: "VerificationConfirmDocument");

            migrationBuilder.DropTable(
                name: "ViolationReportDocument");

            migrationBuilder.DropTable(
                name: "CompanyReport");

            migrationBuilder.DropTable(
                name: "VerificationDocument");

            migrationBuilder.DropTable(
                name: "VerificationConfirmRequirement");

            migrationBuilder.DropTable(
                name: "ViolationReport");

            migrationBuilder.DropTable(
                name: "CompanyReportTypes");

            migrationBuilder.DropTable(
                name: "VerificationCriteria");

            migrationBuilder.DropTable(
                name: "CriteriaDetail");

            migrationBuilder.DropTable(
                name: "VerificationProcess");

            migrationBuilder.DropTable(
                name: "Criteria");

            migrationBuilder.DropTable(
                name: "Agent");

            migrationBuilder.DropTable(
                name: "Company");

            migrationBuilder.DropTable(
                name: "CriteriaType");

            migrationBuilder.DropTable(
                name: "Account");

            migrationBuilder.DropTable(
                name: "CompanyType");

            migrationBuilder.DropTable(
                name: "Province");

            migrationBuilder.DropTable(
                name: "Role");
        }
    }
}
