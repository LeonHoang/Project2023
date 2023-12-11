using Microsoft.EntityFrameworkCore.Migrations;

namespace EcisApi.Migrations
{
    public partial class Assgin_Review_ref : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_VerificationProcess_AssignedAgentReviewId",
                table: "VerificationProcess",
                column: "AssignedAgentReviewId");

            migrationBuilder.AddForeignKey(
                name: "FK_VerificationProcess_Agent_AssignedAgentReviewId",
                table: "VerificationProcess",
                column: "AssignedAgentReviewId",
                principalTable: "Agent",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_VerificationProcess_Agent_AssignedAgentReviewId",
                table: "VerificationProcess");

            migrationBuilder.DropIndex(
                name: "IX_VerificationProcess_AssignedAgentReviewId",
                table: "VerificationProcess");
        }
    }
}
