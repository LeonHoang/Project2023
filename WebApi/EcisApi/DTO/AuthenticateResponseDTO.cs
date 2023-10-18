namespace EcisApi.DTO
{
    public class AuthenticateResponseDTO
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public bool IsVerified { get; set; }
        public string Token { get; set; }
        public int RoleId { get; set; }
        public string RoleName { get; set; }
    }
}
