﻿namespace EcisApi.DTO
{
    public class VerificationProcessRatingDTO
    {
        public int VerificationProcessId { get; set; }
        public int RejectedCount { get; set; }
        public int VerifiedCount { get; set; }
        public int PendingCount { get; set; }
        public int TotalCount { get; set; }
    }
}
