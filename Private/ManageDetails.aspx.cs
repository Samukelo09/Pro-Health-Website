using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;

namespace prohealth.Private
{
    public partial class ManageDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPatientDetails();
            }
        }
        private void LoadPatientDetails()
        {
            // Assuming you use session to get the logged-in user's email
            int patientId = (int)Session["Patient_ID"];

            string query = "SELECT Patient_Name, Patient_Surname, Patient_Phone_No, Patient_Email, Patient_DOB, Patient_Sex FROM Patient WHERE Patient_ID = @ID";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", patientId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Fill the textboxes with the data from the database
                    txtName.Text = reader["Patient_Name"].ToString();
                    txtLastName.Text = reader["Patient_Surname"].ToString();
                    txtPhoneNumber.Text = reader["Patient_Phone_No"].ToString();
                    txtEmail.Text = reader["Patient_Email"].ToString(); // ReadOnly field
                    txtDateOfBirth.Text = Convert.ToDateTime(reader["Patient_DOB"]).ToString("yyyy-MM-dd");
                    txtSex.Text = reader["Patient_Sex"].ToString();
                }
                else
                {
                    StatusLabel.Text = "Unable to load your details. Please try again.";
                }
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            // Ensure Patient_ID is stored in the session after the user logs in or registers
            if (Session["Patient_ID"] != null)
            {
                int patientId = Convert.ToInt32(Session["Patient_ID"]);
                string email = txtEmail.Text;
                // Update query to use Patient_ID instead of Email
                string query = "UPDATE Patient SET Patient_Name = @FirstName, Patient_Surname = @Surname, Patient_Phone_No = @PhoneNumber, Patient_DOB = @DateOfBirth, Patient_Email = @Email WHERE Patient_Id = @Patient_ID";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Surname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@DateOfBirth", DateTime.Parse(txtDateOfBirth.Text));
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text); // Use Patient_ID from session
                    cmd.Parameters.AddWithValue("@Patient_ID", patientId);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Step 2: Update the email in the AspNetUsers table using ASP.NET Identity
                        var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                        var user = manager.FindById(User.Identity.GetUserId());

                        if (user != null)
                        {
                            user.Email = email;
                            user.UserName = email; // Optionally, update UserName if email is used as UserName
                            var result = manager.Update(user);

                            if (result.Succeeded)
                            {
                                StatusLabel.CssClass = "text-success"; // Optional: Change CSS class for success
                                StatusLabel.Text = "Details updated successfully!";
                            }
                            else
                            {
                                StatusLabel.CssClass = "text-danger"; // Optional: Change CSS class for error
                                StatusLabel.Text = "Failed to update email in AspNetUsers table: " + result.Errors.FirstOrDefault();
                            }
                        }
                    }
                    else
                    {
                        StatusLabel.CssClass = "text-danger"; // Optional: Change CSS class for error
                        StatusLabel.Text = "An error occurred while updating your details in Patients table. Please try again.";
                    }
                }
            }
            else
            {
                StatusLabel.CssClass = "text-danger"; // Error if session does not contain Patient_ID
                StatusLabel.Text = "Unable to retrieve your details. Please log in again.";
            }
        }
    }


    
}