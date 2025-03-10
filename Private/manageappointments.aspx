<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageappointments.aspx.cs" Inherits="prohealth.Private._2ndaddappointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <header>
           <script type="text/javascript">
               function SaveVitalSigns() {
                   // Get values from the input fields
                   var systolicBP = document.getElementById('<%= SystolicBPTextBox.ClientID %>').value;
                    var diastolicBP = document.getElementById('<%= DiastolicBPTextBox.ClientID %>').value;
                    var heartRate = document.getElementById('<%= HeartRateTextBox.ClientID %>').value;
                    var bloodGlucose = document.getElementById('<%= BloodGlucoseTextBox.ClientID %>').value;
                    var respiratoryRate = document.getElementById('<%= RespiratoryRateTextBox.ClientID %>').value;
        var temperature = document.getElementById('<%= TemperatureTextBox.ClientID %>').value;
        var reasonForVisit = document.getElementById('<%= ReasonForVisitTextBox.ClientID %>').value;
        var diagnosis = document.getElementById('<%= DiagnosisTextBox.ClientID %>').value;
        var doctorExtraNotes = document.getElementById('<%= DoctorExtraNotesTextBox.ClientID %>').value;

                   // Make an AJAX call to save the data
                   // You will need to implement the server-side logic to save these values

                   $.ajax({
                       type: "POST",
                       url: "YourPage.aspx/SaveVitalSigns", // Replace with your server-side method
                       data: JSON.stringify({
                           systolicBP: systolicBP,
                           diastolicBP: diastolicBP,
                           heartRate: heartRate,
                           bloodGlucose: bloodGlucose,
                           respiratoryRate: respiratoryRate,
                           temperature: temperature,
                           reasonForVisit: reasonForVisit,
                           diagnosis: diagnosis,
                           doctorExtraNotes: doctorExtraNotes
                       }),
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (response) {
                           // Optionally, show a success message and close the modal
                           alert("Vital signs saved successfully!");
                           $('#vitalSignsModal').modal('hide');
                       },
                       error: function (error) {
                           alert("Error saving vital signs: " + error);
                       }
                   });
               }
           </script>
        <style>

            .text {
                margin-top: 20px;
            }       
            .text p {
                margin-top: 10px;
                font-size: 13px;
                font-weight: 700;
                color: #cbced4;
            }

            .input-text {
                margin: 30px 0;
                display: flex;
                gap: 20px;
            }

                .input-text .input-div {
                    width: 100%;
                    position: relative;
                }

            input {
                width: 100%;
                height: 40px;
                border: none;
                outline: 0;
                border-radius: 5px;
                border: 1px solid #cbced4;
                gap: 20px;
                box-sizing: border-box;
                padding: 0px 10px;
            }

            select {
                width: 100%;
                height: 40px;
                border: none;
                outline: 0;
                border-radius: 5px;
                border: 1px solid #cbced4;
                gap: 20px;
                box-sizing: border-box;
                padding: 0px 10px;
            }

            .input-text .input-div span {
                position: absolute;
                top: 10px;
                left: 10px;
                font-size: 14px;
                transition: all 0.5s;
            }

            .input-div input:focus ~ span, .input-div input:valid ~ span {
                top: -15px;
                left: 6px;
                font-size: 10px;
                font-weight: 600;
            }

            .input-div span {
                top: -15px;
                left: 6px;
                font-size: 10px;
            }

            .buttons button {
                height: 40px;
                width: 100px;
                border: none;
                border-radius: 5px;
                background-color: #38b6f4;
                font-size: 12px;
                color: #fff;
                cursor: pointer;
            }

            .button_space {
                display: flex;
                gap: 20px;
            }

                .button_space button:nth-child(1) {
                    background-color: #fff;
                    color: #000;
                    border: 1px solid#000;
                }
                   
        </style> 
    </header> 
    
    <div class="conntainer">
        <h1>View Appointments</h1>
        <div class="container">
            <div class="input-text">
                <div class="input-div">
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" ></asp:TextBox>              
                </div>
                <div class="input-div">
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="input-div">
                     <asp:Button ID="Search" runat="server" Text="Filter" OnClick="Search_Click" />
                </div>
            </div>     
        </div>
      <div class="col-sm-2">
  <div class="row content">
    
      <h2>Filter Appointments</h2>
      <ul class="nav nav-pills nav-stacked">       
         <li><asp:Button ID="btnUpcoming" runat="server" Text="Upcoming" OnClick="btnUpcoming_Click" /></li>         
          <li><asp:Button ID="btnPast" runat="server" Text="Passed" OnClick="btnPast_Click" /></li>
          <asp:SqlDataSource ID="DSPast" runat="server"></asp:SqlDataSource>
      </ul><br>
    </div>
      </div>
    <br>
      <div class="col-lg-8">

    <asp:GridView ID="Appointments" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" width="100%" DataKeyNames="Appt_No" OnRowCommand="Appointments_RowCommand" AllowPaging="True" PageSize="10">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Payment_Status" HeaderText="Payment_Status" SortExpression="Payment_Status" />
            <asp:BoundField DataField="Amount_Paid" HeaderText="Amount_Paid" SortExpression="Amount_Paid" />
            
            <asp:BoundField DataField="Change" HeaderText="Change" SortExpression="Change" />
            <asp:BoundField DataField="Reason_For_Visit" HeaderText="Reason_For_Visit" SortExpression="Reason_For_Visit" />
            <asp:BoundField DataField="Doctor_Extra_Notes" HeaderText="Doctor_Extra_Notes" SortExpression="Doctor_Extra_Notes" />
            <asp:BoundField DataField="Start_Time" HeaderText="Start_Time" SortExpression="Start_Time" />
            <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor_Name" SortExpression="Doctor_Name" />
            <asp:BoundField DataField="Doctor_Surname" HeaderText="Doctor_Surname" SortExpression="Doctor_Surname" />
            <asp:BoundField DataField="Patient_ID" HeaderText="Patient_ID" SortExpression="Patient_ID" />
            <asp:BoundField DataField="Appt_No" HeaderText="Appt_No" InsertVisible="False" ReadOnly="True" SortExpression="Appt_No" />
            <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEditVitals" runat="server" CommandName="EditVitals"
                    Text="View Vitals" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteAppointment" CommandArgument='<%# Eval("Appt_No") %>' />
            </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <HeaderStyle Height="50px" />
        <RowStyle Height="50px" />
        </asp:GridView>
          
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:G7Wst2024ConnectionString %>' 
            SelectCommand="SELECT Appointment_Correct.Date, Appointment_Correct.Payment_Status, Appointment_Correct.Amount_Paid, Appointment_Correct.VAT, Appointment_Correct.Change, Appointment_Correct.Reason_For_Visit, Appointment_Correct.Doctor_Extra_Notes, Timeslot.Start_Time, Doctor.Doctor_Name, Doctor.Doctor_Surname, Appointment_Correct.Patient_ID, Appointment_Correct.Appt_No FROM Appointment_Correct 
            INNER JOIN Doctor ON Appointment_Correct.Doctor_ID = Doctor.Doctor_ID 
            INNER JOIN Patient ON Appointment_Correct.Patient_ID = Patient.Patient_Id 
            AND Appointment_Correct.Patient_ID = Patient.Patient_Id 
            INNER JOIN Timeslot ON Appointment_Correct.Appt_Timeslot_ID = Timeslot.Timeslot_ID 
            WHERE Appointment_Correct.Date BETWEEN @StartDate AND @EndDate 
                   AND (Appointment_Correct.Patient_ID = @PatientId)" 
            DeleteCommand="DELETE FROM Appointment_Correct WHERE (Appt_No = @Appt_No)">
            <DeleteParameters>
                <asp:Parameter Name="Appt_No" />
                
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="PatientId" SessionField="Patient_ID" Type="Int32" />
                 <asp:Parameter Name="StartDate" Type="DateTime" />
                    <asp:Parameter Name="EndDate" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>       
        <asp:Label ID="StatusLabel" runat="server" CssClass="status-message"></asp:Label>
       
    </div>
    </div>
       <div class="modal fade" id="vitalSignsModal" tabindex="-1" role="dialog" aria-labelledby="vitalSignsModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="vitalSignsModalLabel">Edit Vital Signs</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Input fields for vital signs -->
                <div class="form-group">
                    <label for="SystolicBPTextBox">Systolic BP</label>
                    <asp:TextBox ID="SystolicBPTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="DiastolicBPTextBox">Diastolic BP</label>
                    <asp:TextBox ID="DiastolicBPTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="HeartRateTextBox">Heart Rate</label>
                    <asp:TextBox ID="HeartRateTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="BloodGlucoseTextBox">Blood Glucose</label>
                    <asp:TextBox ID="BloodGlucoseTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="RespiratoryRateTextBox">Respiratory Rate</label>
                    <asp:TextBox ID="RespiratoryRateTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="TemperatureTextBox">Temperature</label>
                    <asp:TextBox ID="TemperatureTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="ReasonForVisitTextBox">Reason for Visit</label>
                    <asp:TextBox ID="ReasonForVisitTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="DiagnosisTextBox">Diagnosis</label>
                    <asp:TextBox ID="DiagnosisTextBox" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="DoctorExtraNotesTextBox">Doctor Extra Notes</label>
                    <asp:TextBox ID="DoctorExtraNotesTextBox" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn"/>
            </div>
        </div>
    </div>
</div>
        
</asp:Content>
