using EcisApi.Data;
using EcisApi.DTO;
using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Repositories;
using EcisApi.Services;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using System;
using System.IO;
using System.Reflection;
using Hangfire;
using Hangfire.SqlServer;

namespace EcisApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DataContext>(options =>
                options.UseLazyLoadingProxies().UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddTransient(typeof(IRepository<>), typeof(Repository<>));
            services.AddTransient<IAccountRepository, AccountRepository>();
            services.AddTransient<IAgentRepository, AgentRepository>();
            services.AddTransient<IAgentAssignmentRepository, AgentAssignmentRepository>();
            services.AddTransient<ICompanyRepository, CompanyRepository>();
            services.AddTransient<ICompanyReportRepository, CompanyReportRepository>();
            services.AddTransient<ICompanyReportDocumentRepository, CompanyReportDocumentRepository>();
            services.AddTransient<ICompanyTypeRepository, CompanyTypeRepository>();
            services.AddTransient<ICompanyTypeModificationRepository, CompanyTypeModificationRepository>();
            services.AddTransient<ICriteriaRepository, CriteriaRepository>();
            services.AddTransient<ICriteriaDetailRepository, CriteriaDetailRepository>();
            services.AddTransient<ICriteriaTypeRepository, CriteriaTypeRepository>();
            services.AddTransient<IDocumentReviewRepository, DocumentReviewRepository>();
            services.AddTransient<IProvinceRepository, ProvinceRepository>();
            services.AddTransient<IRoleRepository, RoleRepository>();
            services.AddTransient<ISystemConfigurationRepository, SystemConfigurationRepository>();
            services.AddTransient<IThirdPartyRepository, ThirdPartyRepository>();
            //services.AddTransient<IVerificationConfirmRequirementRepository, VerificationConfirmRequirementRepository>();
            //services.AddTransient<IVerificationConfirmDocumentRepository, VerificationConfirmDocumentRepository>();
            services.AddTransient<IVerificationCriteriaRepository, VerificationCriteriaRepository>();
            services.AddTransient<IVerificationDocumentRepository, VerificationDocumentRepository>();
            services.AddTransient<IVerificationProcessRepository, VerificationProcessRepository>();
            services.AddTransient<IViolationReportRepository, ViolationReportRepository>();
            services.AddTransient<IViolationReportDocumentRepository, ViolationReportDocumentRepository>();

            services.AddTransient<IAccountService, AccountService>();
            services.AddTransient<IAgentService, AgentService>();
            services.AddTransient<ICompanyService, CompanyService>();
            services.AddTransient<ICompanyReportService, CompanyReportService>();
            services.AddTransient<ICompanyReportDocumentService, CompanyReportDocumentService>();
            services.AddTransient<ICompanyTypeService, CompanyTypeService>();
            services.AddTransient<ICriteriaService, CriteriaService>();
            services.AddTransient<ICriteriaDetailService, CriteriaDetailService>();
            services.AddTransient<ICriteriaTypeService, CriteriaTypeService>();
            services.AddTransient<IDocumentReviewService, DocumentReviewService>();
            services.AddTransient<IFileService, FileService>();
            services.AddTransient<IJobService, JobService>();
            services.AddTransient<IProvinceService, ProvinceService>();
            services.AddTransient<IRoleService, RoleService>();
            services.AddTransient<IThirdPartyService, ThirdPartyService>();
            // services.AddTransient<IVerificationConfirmRequirementService, VerificationConfirmRequirementService>();
            services.AddTransient<IVerificationCriteriaService, VerificationCriteriaService>();
            services.AddTransient<IVerificationDocumentService, VerificationDocumentService>();
            services.AddTransient<IVerificationProcessService, VerificationProcessService>();
            services.AddTransient<IViolationReportService, ViolationReportService>();
            services.AddTransient<IViolationReportDocumentService, ViolationReportDocumentService>();

            services.AddTransient<IUnitOfWork, UnitOfWork>();
            services.AddTransient<IEmailHelper, EmailHelper>();

            // Add Hangfire services.
            services.AddHangfire(configuration => configuration
                .SetDataCompatibilityLevel(CompatibilityLevel.Version_180)
                .UseSimpleAssemblyNameTypeSerializer()
                .UseRecommendedSerializerSettings()
                .UseSqlServerStorage(Configuration.GetConnectionString("DefaultConnection")));

            // Add the processing server as IHostedService
            services.AddHangfireServer();

            services.AddCors(options =>
            {
                options.AddDefaultPolicy(
                    builder =>
                    {
                        builder.WithOrigins("*")
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                    });
            });

            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v0.1",
                    Title = "Ecis API"
                });

                var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                options.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
            });

            services.AddControllers()
                .AddFluentValidation(s =>
                {
                    s.RegisterValidatorsFromAssemblyContaining<Startup>();
                })
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
                );

            // configure strongly typed settings object
            services.Configure<AppSettings>(Configuration.GetSection("AppSettings"));

            services.AddTransient<IValidator<AgentCreateDTO>, AgentCreateDTOValidator>();
            services.AddTransient<IValidator<AuthenticateRequestDTO>, AuthenticateRequestDTOValidator>();
            services.AddTransient<IValidator<ChangePasswordDTO>, ChangePasswordDTOValidator>();
            services.AddTransient<IValidator<CompanyRegistrationDTO>, CompanyRegistrationDTOValidator>();
            services.AddTransient<IValidator<CompanyReportDTO>, CompanyReportDTOValidator>();
            services.AddTransient<IValidator<PublicV1AuthenticateDTO>, PublicV1AuthenticateDTOValidator>();
            services.AddTransient<IValidator<ThirdPartyRegisterDTO>, ThirdPartyRegisterDTOValidator>();
            // services.AddTransient<IValidator<VerificationConfirmRequirement>, VerificationConfirmRequirementValidator>();
            services.AddTransient<IValidator<VerificationConfirmUpdateDTO>, VerificationConfirmUpdateDTOValidator>();
            services.AddTransient<IValidator<VerifyCompanyDTO>, VerifyCompanyDTOValidator>();
            services.AddTransient<IValidator<ViolationReportDTO>, ViolationReportDTOValidator>();
            services.AddScoped<IJobService, JobService>();
            services.AddHttpClient();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IBackgroundJobClient backgroundJobs, IWebHostEnvironment env)
        {
            if (env.IsProduction())
            {
                using var serviceScope = app.ApplicationServices.GetRequiredService<IServiceScopeFactory>().CreateScope();
                serviceScope.ServiceProvider.GetService<DataContext>().Database.Migrate();
            }

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHangfireDashboard();
            //backgroundJobs.Enqueue(() => Console.WriteLine("Hello world from Hangfire!"));

            app.UseRouting();

            app.UseCors();

            app.UseAuthorization();

            app.UseMiddleware<JwtMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapHangfireDashboard();
            });
        }
    }
}
