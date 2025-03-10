using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;

namespace prohealth.Services
{
    public class EmailSender
    {
        // using SendGrid's C# Library

        internal class Example
        {
            private static void Main()
            {
                SendMail().Wait();
            }

            static async Task SendMail()
            {
                var apiKey = Environment.GetEnvironmentVariable("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");
                var client = new SendGridClient(apiKey);
                var from = new EmailAddress("siphilele0305@gmail.com", "Prohealth");
                var subject = "Sending with SendGrid is Fun";
                var to = new EmailAddress("sphilelemkhizee71@gmail.com", "Ndishi");
                var plainTextContent = "dgdhrthrthrth";
                var htmlContent = "<strong>Confirm email<strong>";
                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                var response = await client.SendEmailAsync(msg);
            }
        }
    }
}
