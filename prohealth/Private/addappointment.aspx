<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addappointment.aspx.cs" Inherits="prohealth.Private.addappointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
            .doctor-button {
                width: 200px; /* Adjust width */
                height: 200px;
                border-radius: 10px; /* Rounded corners */
                border: 2px solid #007bff; /* Blue border */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow */
                transition: all 0.3s ease; /* Smooth transition on hover */
                padding: 10px;
                background-color: #f8f9fa; /* Light background */
            }

                .doctor-button:hover {
                    transform: scale(1.05); /* Slightly bigger on hover */
                    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
                    border-color: #28a745; /* Change border color on hover */
                }

            .row {
                display: flex; /* Use flexbox */
                justify-content: center; /* Center items horizontally */
                align-items: center; /* Center items vertically */
                flex-wrap: wrap; /* Allow items to wrap onto the next line */
            }
            .imgg {
                border-radius: 10px;
            }
     .appointment-container {
    max-width: 1600px;
    height: 800px;
    margin: auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
   
    text-align: center;
}

h2 {
    
    margin-top: 0;
}

.doctor-selection {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin-bottom: 20px;
}

.doctor-option {
    text-align: center;
    margin: 10px;
}

.doctor-button {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.doctor-button:hover {
    transform: scale(1.1);
}

.doctor-name {
    display: block;
    margin-top: 8px;
    font-size: 14px;
    color: #333;
    font-weight: bold;
}

.form-group {
    margin: 15px 0;
}

.form-control {
    width: 100%;
    max-width: 400px;
    margin: auto;
    padding: 8px;
    font-size: 16px;
}

.timeslot-dropdown {
    display: inline-block;
}

.button-group {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
}

.btn {
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-default {
    background-color: #ccc;
    color: #333;
}

.modern-btn {
    background-color: #38b6f4;
    color: #fff;
    border: none;
}

.modern-btn:hover {
    background-color: #2a91c4;
}

.text-danger {
    color: red;
    font-size: 12px;
}

.error-message {
    color: red;
    margin-top: 10px;
}




        </style>
        <script>

            var currentSelectedButton = null; // Track currently selected doctor button

            function selectDoctor(selectedButton, doctorId) {
                // If the same button is clicked again, deselect it
                if (currentSelectedButton === selectedButton) {
                    // Deselect button
                    selectedButton.style.border = "";
                    selectedButton.disabled = false;
                    document.getElementById('<%= SelectedDoctorId.ClientID %>').value = ""; 
            currentSelectedButton = null; 

            // Hide date and timeslot selection when doctor is deselected
            document.getElementById("appointmentSelection").style.display = "none"; 
        } else {
            // Re-enable all buttons and remove styles
            var buttons = document.getElementsByClassName('doctor-button');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].disabled = false; 
                buttons[i].style.border = ""; 
            }

            // Apply selected style and disable the chosen button
            selectedButton.style.border = "2px solid green"; 
            selectedButton.disabled = true; 

            // Set the hidden field value
            document.getElementById('<%= SelectedDoctorId.ClientID %>').value = doctorId;

                    // Update the currently selected button
                    currentSelectedButton = selectedButton;

                    // Show date and timeslot selection once a doctor is selected
                    document.getElementById("appointmentSelection").style.display = "block";
                }
            }

            $(document).ready(function () {
                // Initialize the dialog and make sure it’s hidden initially
                $("#appointmentDialog").dialog({
                    autoOpen: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                        }
                        
                    }
                });
            });

            function showAppointmentDialog() {
                // Open the dialog when the button is clicked
                $("#appointmentDialog").dialog("open");
            }
        </script>
    </header>
    
   <div class="conntainer">
    <asp:HiddenField ID="SelectedDoctorId" runat="server" />
       
       
    <div class="appointment-container">
        <div class="header-title">
<h2>Make Appointment</h2>
        <hr />
        </div>
       
        <h3>Select a Doctor</h3>

        
        <div class="doctor-selection">
           
            <div class="doctor-option">
                <asp:ImageButton ID="Doctor1" runat="server"
                    ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/siphilele-avatar.jpg"
                    CssClass="doctor-button"
                    OnClientClick="selectDoctor(this, '1'); return false;" />
                <asp:Label ID="Name1" runat="server" Text="Dr Siphilele Mkhize" AssociatedControlID="Doctor1" CssClass="doctor-name"></asp:Label>
            </div>
            <div class="doctor-option">
                <asp:ImageButton ID="Doctor2" runat="server"
                    ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/dr2.jpg"
                    CssClass="doctor-button"
                    OnClientClick="selectDoctor(this, '2'); return false;" />
                <asp:Label ID="Name2" runat="server" Text="Dr Zolile Mzobe" AssociatedControlID="Doctor2" CssClass="doctor-name"></asp:Label>
            </div>
            <div class="doctor-option">
                <asp:ImageButton ID="Doctor3" runat="server"
                    ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/olwethu-avatar.jpg"
                    CssClass="doctor-button"
                    OnClientClick="selectDoctor(this, '3'); return false;" />
                <asp:Label ID="Name3" runat="server" Text="Dr Olwethu Nxasane" AssociatedControlID="Doctor3" CssClass="doctor-name"></asp:Label>
            </div>
            <div class="doctor-option">
                <asp:ImageButton ID="Doctor4" runat="server"
                    ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/nkanyezi-avatar.jpg"
                    CssClass="doctor-button"
                    OnClientClick="selectDoctor(this, '4'); return false;" />
                <asp:Label ID="Name4" runat="server" Text="Dr Nkanyezi Ngobese" AssociatedControlID="Doctor4" CssClass="doctor-name"></asp:Label>
            </div>
            <div class="doctor-option">
                <asp:ImageButton ID="Doctor5" runat="server"
                    ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/samukelo-avatar.jpg"
                    CssClass="doctor-button"
                    OnClientClick="selectDoctor(this, '5'); return false;" />
                <asp:Label ID="Name5" runat="server" Text="Dr Samukelo Mkhize" AssociatedControlID="Doctor5" CssClass="doctor-name"></asp:Label>
            </div>
        </div>

        <h3>Select Date and Time</h3>

        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dateSelect" Text="Select Date" />
            <asp:TextBox runat="server" ID="dateSelect" CssClass="form-control datepicker" TextMode="Date" AutoPostBack="True" OnTextChanged="DateSelect_TextChanged" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="dateSelect" CssClass="text-danger" ErrorMessage="Select date of appointment." />
        </div>

     
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="TimePicker" Text="Choose Time" />
            <asp:DropDownList ID="TimePicker" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Start_Time" DataValueField="Timeslot_ID" />
            <asp:HiddenField ID="TodayDate" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="TimePicker" CssClass="text-danger" ErrorMessage="Select a time slot." />
        </div>

       
        <div class="button-group">
            <asp:Button ID="Default" runat="server" Text="Cancel" CssClass="btn btn-default" />
            <asp:Button ID="Makeappt" runat="server" Text="Create Appointment" CssClass="btn modern-btn" OnClick="Makeappt_Click" OnClientClick="showAppointmentDialog(); return false;"/>
        </div>
         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" Text=""></asp:Label>
    </div>
</div>

 <!-- Bootstrap Modal -->
<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Appointment added successfully</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="modern-btn" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>




        

 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:G7Wst2024ConnectionString %>"
    SelectCommand="
        SELECT Timeslot_ID, Start_Time 
        FROM Timeslot 
        WHERE Timeslot_ID NOT IN 
        (
            SELECT Appt_Timeslot_ID 
            FROM Appointment_Correct 
            WHERE Date = @SelectedDate 
              AND (Doctor_ID = @DoctorID OR Patient_ID = @PatientID)
        )">
    <SelectParameters>

        <asp:ControlParameter Name="SelectedDate" ControlID="dateSelect" PropertyName="Text" Type="DateTime" />


        <asp:Parameter Name="DoctorID" Type="Int32" />

        <asp:Parameter Name="PatientID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

</asp:Content>
