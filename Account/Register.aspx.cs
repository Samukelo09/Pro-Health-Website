using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using prohealth.Models;
using System.Configuration;
using System.Data.SqlClient;
using SendGrid;
using SendGrid.Helpers.Mail;


namespace prohealth.Account
{
    public partial class Register : Page
    {

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };


            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                // Assign the role as 'Patient'
                if (!manager.IsInRole(user.Id, "Patient")) // Assuming "Patient" is the role name
                {
                    result = manager.AddToRole(user.Id, "Patient");
                    if (!result.Succeeded)
                    {
                        ErrorMessage.Text = result.Errors.FirstOrDefault();
                        return; // Exit if there's an error
                    }
                }

                // Generate email confirmation token
                string code = manager.GenerateEmailConfirmationToken(user.Id);

                // Create the confirmation URL
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);

                // Send confirmation email via SendGrid
                SendEmailConfirmation(user.Email, callbackUrl);

                // Sign the user in
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                // Get additional user details
                string name = Name.Text; // Assuming TextBox with ID "Name"
                string surname = Surname.Text; // Assuming TextBox with ID "Surname"
                DateTime dob = DateTime.Parse(DOB.Text); // Assuming TextBox with ID "DOB"
                string sex = RadioButtonListSex.SelectedValue; // Assuming RadioButtonList with ID "RadioButtonListSex"
                string email = Email.Text;
                string phoneno = Number.Text;

                // Save patient details to the database
                SavePatientDetails(name, surname, dob, sex, email, phoneno);

                // Assuming you have a method to get the new patient ID. Modify as necessary:
                int patientId = GetPatientIdByEmail(email); // Add this method

                // Set the session variable
                Session["Patient_ID"] = patientId;

                // Redirect to return URL
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);

                // Redirect or display success message
                Response.Redirect("RegisterSuccess.aspx");

            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        // Method to retrieve the patient ID based on email or other unique identifier
        private int GetPatientIdByEmail(string email)
        {
            int patientId = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Patient_ID FROM Patient WHERE Patient_Email = @Email"; // Assuming Patient_ID is the primary key

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    conn.Open();
                    var result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        patientId = Convert.ToInt32(result);
                    }
                }
            }
            return patientId;
        }
        private void SavePatientDetails(string name, string surname, DateTime dob, string sex, string email, string phoneno)
        {


            // Your database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Patient (Patient_Name, Patient_Surname, Patient_DOB, Patient_Sex, Patient_Email, Patient_Phone_No) VALUES (@Name, @Surname, @DOB, @Sex, @Email, @Phone)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Surname", surname);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@Sex", sex);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phoneno); // Optional: track which user this patient corresponds to

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        private void SendEmailConfirmation(string email, string callbackUrl)
        {
            var apiKey = "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"; // Your SendGrid API key
            var client = new SendGridClient(apiKey);
            var from = new EmailAddress("siphilele0305@gmail.com", "Prohealth");
            var subject = "Confirm your email";
            var to = new EmailAddress(email);
            var plainTextContent = $"Please confirm your account by clicking this link: {callbackUrl}";
            var htmlContent = $"<strong>Please confirm your account by clicking this link:</strong> <a href=\"{callbackUrl}\">{callbackUrl}</a>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);

            // Send the email
            client.SendEmailAsync(msg);
        }

    }
}