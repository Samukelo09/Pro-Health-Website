<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSchedule.aspx.cs" Inherits="prohealth.Private.Doctor.ViewSchedule" %>
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
            .custom-modal .modal-content {
                background-color: #f8f9fa; /* Light background */
                border-radius: 8px; /* Rounded corners */
            }

            .custom-modal .modal-header {
                background-color: #007bff; /* Blue header */
                color: white; /* White text */
            }

            .custom-modal .modal-footer {
                background-color: #f1f1f1; /* Light gray footer */
            }

            .custom-modal .modal-title {
                font-weight: bold; /* Bold title */
            }

            .custom-modal .form-control {
                border-radius: 5px; /* Rounded input fields */
            }
        </style>

       
    </header>
    <div class="conntainer"> 
    <h1>Schedule</h1>
    <div class="row">
        <div class="col-sm-3">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="Calendar1_SelectionChanged" >
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            
            <h3><span class="glyphicon glyphicon-list-alt"></span> Upcoming Appointments</h3>
        </div>
        <br />
        <div class="col-sm-8">
            <div>
                <div class="col-sm-6" style="display: flex">
                    <asp:Label ID="Label2" runat="server" Text="Search Patient: " AssociatedControlID="Search"></asp:Label><asp:TextBox ID="Search" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6" style="display: flex">
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="FilterButton" runat="server" Text="Filter by Date" OnClick="FilterButton_Click" />
                </div>
                <asp:Label ID="StatusLabel" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found." DataSourceID="SqlDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" DataKeyNames="Appt_No">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEditVitals" runat="server" CommandName="EditVitals"
                                    Text="Edit Vitals" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Start_Time" HeaderText="Start_Time" SortExpression="Start_Time" Visible="true" />
                        <asp:BoundField DataField="Patient_Name" HeaderText="Patient_Name" SortExpression="Patient_Name" />
                        <asp:BoundField DataField="Patient_Surname" HeaderText="Patient_Surname" SortExpression="Patient_Surname" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Amount_Paid" HeaderText="Amount_Paid" SortExpression="Amount_Paid" />

                        <asp:BoundField DataField="Doctor_ID" HeaderText="Doctor_ID" SortExpression="Doctor_ID" />
                        <asp:BoundField DataField="Appt_No" HeaderText="Appt_No" InsertVisible="False" ReadOnly="True" SortExpression="Appt_No" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                    SelectCommand="SELECT Patient.Patient_Name, Patient.Patient_Surname, Appointment_Correct.Date, Appointment_Correct.Amount_Paid, Timeslot.Start_Time, Appointment_Correct.Doctor_ID, Appointment_Correct.Appt_No FROM Appointment_Correct INNER JOIN Patient ON Appointment_Correct.Patient_ID = Patient.Patient_Id INNER JOIN Timeslot ON Appointment_Correct.Appt_Timeslot_ID = Timeslot.Timeslot_ID WHERE (Appointment_Correct.Date BETWEEN @StartDate AND @EndDate) AND (Appointment_Correct.Doctor_ID = @DoctorID)" UpdateCommand="UPDATE Appointment_Correct SET Systolic_BP = @Systolic_BP, Diastolic_BP = @Diastolic_BP, Heart_Rate = @Heart_Rate, Blood_Glucose = @Blood_Glucose, Respiratory_Rate = @Respiratory_Rate, Temperature = @Temperature, Reason_For_Visit = @Reason_For_Visit, Diagnosis = @Diagnosis, Doctor_Extra_Notes = @Doctor_Extra_Notes">
                    <SelectParameters>
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:SessionParameter Name="DoctorID" Type="Int32" SessionField="Doctor_ID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="SystolicBPTextBox" Name="Systolic_BP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DiastolicBPTextBox" Name="Diastolic_BP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="HeartRateTextBox" Name="Heart_Rate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="BloodGlucoseTextBox" Name="Blood_Glucose" PropertyName="Text" />
                        <asp:ControlParameter ControlID="RespiratoryRateTextBox" Name="Respiratory_Rate" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TemperatureTextBox" Name="Temperature" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ReasonForVisitTextBox" Name="Reason_For_Visit" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DiagnosisTextBox" Name="Diagnosis" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DoctorExtraNotesTextBox" Name="Doctor_Extra_Notes" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <!-- Modal HTML -->
                <div class="modal fade" id="vitalSignsModal" tabindex="-1" role="dialog" aria-labelledby="vitalSignsModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content custom-modal">
                            <div class="modal-header">
                                <h5 class="modal-title" id="vitalSignsModalLabel">Edit Vital Signs</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="vitalSignsForm">
                                <div class="form-group">
                                    <label for="SystolicBPTextBox">Systolic BP</label>
                                    <asp:TextBox ID="SystolicBPTextBox" runat="server" CssClass="form-control" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <label for="DiastolicBPTextBox">Diastolic BP</label>
                                    <asp:TextBox ID="DiastolicBPTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="HeartRateTextBox">Heart Rate</label>
                                    <asp:TextBox ID="HeartRateTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="BloodGlucoseTextBox">Blood Glucose</label>
                                    <asp:TextBox ID="BloodGlucoseTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="RespiratoryRateTextBox">Respiratory Rate</label>
                                    <asp:TextBox ID="RespiratoryRateTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="TemperatureTextBox">Temperature</label>
                                    <asp:TextBox ID="TemperatureTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="ReasonForVisitTextBox">Reason for Visit</label>
                                    <asp:TextBox ID="ReasonForVisitTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="DiagnosisTextBox">Diagnosis</label>
                                    <asp:TextBox ID="DiagnosisTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label for="DoctorExtraNotesTextBox">Doctor Extra Notes</label>
                                    <asp:TextBox ID="DoctorExtraNotesTextBox" runat="server" CssClass="form-control" Enabled="false"/>
                                </div>
                                    </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="login" data-dismiss="modal">Close</button>
                                
                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>    
    </div>
        </div>
</asp:Content>
