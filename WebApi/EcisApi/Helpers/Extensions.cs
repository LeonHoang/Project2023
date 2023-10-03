using System;

namespace EcisApi.Helpers
{
    public static class Extensions
    {
        public static DateTime AddByType(this DateTime dateTime, int amount, string type)
        {
            var result = type.ToLower() switch
            {
                "second" or "seconds" => dateTime.AddSeconds(amount),
                "minute" or "minutes" => dateTime.AddMinutes(amount),
                "hour" or "hours" => dateTime.AddHours(amount),
                "day" or "days" => dateTime.AddDays(amount),
                "month" or "months" => dateTime.AddMonths(amount),
                "year" or "years" => dateTime.AddYears(amount),
                _ => dateTime
            };
            return result;
        }

    }
}
