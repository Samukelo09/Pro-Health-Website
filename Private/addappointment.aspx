<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addappointment.aspx.cs" Inherits="prohealth.Private.addappointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
    .doctor-button {
    border: 2px solid transparent; /* Default border */
    padding: 5px;
    transition: border-color 0.3s ease;
  }

.doctor-button:hover {
    border-color: #007bff; /* Highlight on hover */
}

.doctor-button.selected {
    border-color: green; /* Highlight selected button */
}

        </style>
    </header>
    
        <h1>Make New Appointment</h1>
   
    
    <div class="container">
       <h2>Step 1: Select date and time</h2> 
     <div class="form-group col-md-6">
    <asp:Label runat="server" AssociatedControlID="dateSelect">Select Date</asp:Label>
    <asp:TextBox runat="server" ID="dateSelect" CssClass="form-control" TextMode="Date" AutoPostBack="True" OnTextChanged="DateSelect_TextChanged" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="dateSelect" CssClass="text-danger" ErrorMessage="Select date of appointment." />
</div>

<div class="form-group col-md-6">
    <asp:Label runat="server" AssociatedControlID="TimePicker">Time</asp:Label>
    <asp:DropDownList ID="TimePicker" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Start_Time" DataValueField="Timeslot_ID"></asp:DropDownList>
    <asp:HiddenField ID="TodayDate" runat="server" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="TimePicker" CssClass="text-danger" ErrorMessage="Select date of appointment." />


    




    <!-- Adjusted SqlDataSource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G7Wst2024ConnectionString %>" 
        SelectCommand="SELECT Timeslot_ID, Start_Time 
                       FROM Timeslot 
                       WHERE Timeslot_ID NOT IN 
                       (SELECT Appt_Timeslot_ID 
                        FROM Appointment_Correct 
                        WHERE Date = @SelectedDate)">
        <SelectParameters>
            <asp:ControlParameter Name="SelectedDate" ControlID="dateSelect" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
        
        
            
        <div class="row">
            <h2>Step 2: Select practitioner</h2>
    <asp:HiddenField ID="SelectedDoctorId" runat="server" />

    <div class="col-md-4 col-sm-6">  
       
        <asp:ImageButton ID="Doctor1" runat="server" 
                         ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" 
                         CssClass="doctor-button" 
                         OnClientClick="selectDoctor(this, '1'); return false;" />
        <asp:Label ID="Name1" runat="server" Text="Siphilele" AssociatedControlID="Doctor1"></asp:Label>
    </div>

    <div class="col-md-4 col-sm-6">           
        <asp:ImageButton ID="Doctor2" runat="server" 
                         ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" 
                         CssClass="doctor-button" 
                         OnClientClick="selectDoctor(this, '2'); return false;" />
        <asp:Label ID="Name2" runat="server" Text="Zoe" AssociatedControlID="Doctor2"></asp:Label>
    </div>

    <div class="col-md-4 col-sm-6">           
        <asp:ImageButton ID="Doctor3" runat="server" 
                         ImageUrl="~/Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" 
                         CssClass="doctor-button" 
                         OnClientClick="selectDoctor(this, '3'); return false;" />
        <asp:Label ID="Name3" runat="server" Text="Olwethu" AssociatedControlID="Doctor3"></asp:Label>
    </div>
</div>
            

<script>
    var currentSelectedButton = null; // To track the currently selected button

    function selectDoctor(selectedButton, doctorId) {
        // If the same button is clicked again, deselect it
        if (currentSelectedButton === selectedButton) {
            // Deselect the button
            selectedButton.style.border = ""; // Remove the border
            selectedButton.disabled = false; // Re-enable the button
            document.getElementById('<%= SelectedDoctorId.ClientID %>').value = ""; // Clear selection
            currentSelectedButton = null; // Reset the selection
        } else {
            // Disable all buttons
            var buttons = document.getElementsByClassName('doctor-button');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].disabled = false; // Re-enable all buttons
                buttons[i].style.border = ""; // Remove border from all buttons
            }

            // Apply a 'selected' style to the clicked button
            selectedButton.style.border = "2px solid green"; // Add visual feedback
            selectedButton.disabled = true; // Disable the newly selected button

            // Set the hidden field's value to the selected doctor's ID
            document.getElementById('<%= SelectedDoctorId.ClientID %>').value = doctorId;

            // Update the currently selected button
            currentSelectedButton = selectedButton;
        }
    }
</script>



            <asp:Label ID="ErrorMessage" runat="server" Text="Label"></asp:Label>
            <div>&nbsp</div>
            <div class="row">
                <div class="col-md-4 col-sm-6">
            <asp:Button ID="Default" runat="server" Text="Cancel" CssClass="btn btn-default"/>
                </div>
            <div style="text-align:end">
            <asp:Button ID="Makeappt" runat="server" Text="Create Appointment" CssClass="btn modern-btn" OnClick="Makeappt_Click"/>
                </div>
            </div>
        </div>
           
        
        
      
        
        
        
        
</asp:Content>
