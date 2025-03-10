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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string todayDate = DateTime.Now.AddDays(0).ToString("yyyy-MM-dd");
                
                DOB.Attributes["max"] = todayDate;
               
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            string email = Email.Text;

            // Check if the email exists in the Patient table
            int patientId = GetPatientIdByEmail(email);

            if (patientId > 0) // Patient exists in the Patient table
            {
                // Check if the user already exists in AspNetUsers
                var existingUser = manager.FindByEmail(email);
                if (existingUser == null) // User doesn't exist in AspNetUsers
                {
                    var user = new ApplicationUser() { UserName = email, Email = email };
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
                else
                {
                    ErrorMessage.Text = "This email is already registered with the system.";
                }
            }
            else // Email not found in Patient table
            {
                ErrorMessage.Text = "Email not found in the Patient records. Please register as a new patient.";
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
                // Query to check if the email already exists
                string checkQuery = "SELECT COUNT(1) FROM Patient WHERE Patient_Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);

                    conn.Open();
                    int emailExists = Convert.ToInt32(checkCmd.ExecuteScalar());
                    conn.Close();

                    if (emailExists > 0)
                    {
                        // Email already exists
                        ScriptManager.RegisterStartupScript(this, GetType(), "showConfirmationModal",
          "$('#ErrorModal').modal('show');", true);

                    }    
                    
                }

               
                string insertQuery = "INSERT INTO Patient (Patient_Name, Patient_Surname, Patient_DOB, Patient_Sex, Patient_Email, Patient_Phone_No) VALUES (@Name, @Surname, @DOB, @Sex, @Email, @Phone)";

                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                {
                    insertCmd.Parameters.AddWithValue("@Name", name);
                    insertCmd.Parameters.AddWithValue("@Surname", surname);
                    insertCmd.Parameters.AddWithValue("@DOB", dob);
                    insertCmd.Parameters.AddWithValue("@Sex", sex);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Phone", phoneno);

                    conn.Open();
                    insertCmd.ExecuteNonQuery();
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