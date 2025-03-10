using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prohealth.Helpers
{
    public static class IdentityHelper
    {
        
            public static string GetUserConfirmationRedirectUrl(string code, string userId, HttpRequest request)
            {
                var absoluteUri = request.Url.GetLeftPart(UriPartial.Path);
                return $"{absoluteUri}/Confirmation.aspx?code={HttpUtility.UrlEncode(code)}&userId={HttpUtility.UrlEncode(userId)}";
            }
        

    }
}