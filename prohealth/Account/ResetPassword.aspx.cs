using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using prohealth.Models;

namespace prohealth.Account
{
    public partial class ResetPassword : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void ResetPasswordButton_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            string userId = Request.QueryString["userId"];
            string code = HttpUtility.UrlDecode(Request.QueryString["code"]); // Decode the token

            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(code))
            {
                ErrorMessage.Text = "Invalid password reset link.";
                return;
            }

            // Validate password complexity (adjust as needed)
            if (Password.Text.Length < 8 ||
                !Password.Text.Any(char.IsUpper) ||
                !Password.Text.Any(char.IsLower) ||
                !Password.Text.Any(char.IsDigit) ||
                !Password.Text.Any(c => "!@#$%^&*".Contains(c)))
            {
                ErrorMessage.Text = "Password must be at least 8 characters long, contain uppercase and lowercase letters, a number, and a special character.";
                return;
            }

            // Reset the password
            var result = manager.ResetPassword(userId, code, Password.Text);
            if (result.Succeeded)
            {
                // Redirect to login page or display success message
                Response.Redirect("~/Account/Login.aspx?message=PasswordResetSuccess");
            }
            else
            {
                // Display all errors for debugging
                ErrorMessage.Text = string.Join("<br/>", result.Errors);
            }
        }

    }
}

