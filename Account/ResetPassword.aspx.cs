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

            // Validate the password (e.g., length, complexity)
            if (Password.Text.Length < 6) // Example validation
            {
                ErrorMessage.Text = "Password must be at least 6 characters long.";
                return;
            }

            var result = manager.ResetPassword(userId, code, Password.Text);
            if (result.Succeeded)
            {
                // Redirect to login page or display success message
                Response.Redirect("~/Account/Login.aspx?message=PasswordResetSuccess");
            }
            else
            {
                // Display all errors
                ErrorMessage.Text = string.Join("<br/>", result.Errors);
            }
        }

    }
}

