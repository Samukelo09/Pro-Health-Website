using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using prohealth.Models;

namespace prohealth.Account
{
    public partial class Confirm : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure this runs only once
            {
                string code = Request.QueryString["code"];
                string userId = Request.QueryString["userId"];

                if (!string.IsNullOrEmpty(code) && !string.IsNullOrEmpty(userId))
                {
                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var result = manager.ConfirmEmail(userId, code);

                    if (result.Succeeded)
                    {
                        successPanel.Visible = true; // Show success message
                    }
                    else
                    {
                        errorPanel.Visible = true; // Show error message
                        errorMessageLabel.Text = string.Join(", ", result.Errors);
                    }
                }
                else
                {
                    errorPanel.Visible = true; // Invalid confirmation link
                    errorMessageLabel.Text = "Error: Invalid confirmation link.";
                }
            }
        }

    }
}