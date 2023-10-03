namespace EcisApi.Helpers
{
    public class AppSettings
    {
        public string Secret { get; set; }

        // Email config
        public string EmailSender { get; set; }
        public string EmailPassword { get; set; }
        public string SmtpServer { get; set; }
        public int SmtpPortNumber { get; set; }
    }
}
