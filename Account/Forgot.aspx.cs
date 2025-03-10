using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using prohealth.Models;
using System.Net.Mail;
using SendGrid;
using System.Threading.Tasks;
using SendGrid.Helpers.Mail;

namespace prohealth.Account
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void SendLinkButton_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = await manager.FindByEmailAsync(Email.Text); // Use async method

            if (user != null)
            {
                // Generate the password reset token
                 // Use async method

                // Create a reset link
                string code = manager.GeneratePasswordResetToken(user.Id);
                string encodedCode = HttpUtility.UrlEncode(code);
                string callbackUrl = String.Format("https://localhost:44301/Account/ResetPassword?userId={0}&code={1}", user.Id, encodedCode);

                

                // Send email
                await SendEmailAsync(user.Email, callbackUrl); // Await the async call
                SuccessMessage.Text = "Reset link has been sent to your email.";
            }
            else
            {
                //ErrorMessage.Text = "No user found with this email."; // Uncomment and use this line
            }
        }




        private async Task SendEmailAsync(string email, string callbackUrl)
        {
            var client = new SendGridClient("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"); // Your SendGrid API key
            var from = new EmailAddress("siphilele0305@gmail.com", "Prohealth");
            var subject = "Reset Password";
            var to = new EmailAddress(email);
            var plainTextContent = "Please reset your password by clicking here: " + callbackUrl;
            var htmlContent = $"<strong>Please reset your password by clicking here: <a href=\"{callbackUrl}\">link</a></strong>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);

            try
            {
                var response = await client.SendEmailAsync(msg);

                // Check if the status code is between 200 and 299 (indicating success)
                if (response.StatusCode >= System.Net.HttpStatusCode.OK && response.StatusCode < System.Net.HttpStatusCode.Ambiguous)
                {
                    // Email sent successfully, handle success if needed
                }
                else
                {
                    // Log the response status code and any other relevant information
                    var responseBody = await response.Body.ReadAsStringAsync();
                    throw new Exception($"Failed to send email: {response.StatusCode} - {responseBody}");
                }
            }
            catch (Exception ex)
            {
                // Log the exception and/or display a user-friendly message
                throw; // You can replace this with your logging logic
            }
        }




    }
}
