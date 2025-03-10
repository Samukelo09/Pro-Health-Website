<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientInfo.aspx.cs" Inherits="prohealth.Private.Doctor.PatientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <header>
         <style>
             /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
             .row.content {
                 height: 550px
             }

             /* Set gray background color and 100% height */
             .sidenav {
                 background-color: #f1f1f1;
                 height: 100%;
             }

             /* On small screens, set height to 'auto' for the grid */
             @media screen and (max-width: 767px) {
                 .row.content {
                     height: auto;
                 }
             }

             .chart-container {
                 width: 100%;
                 height: 0;
                 padding-bottom: 56.25%; /* Adjust this for your desired aspect ratio */
                 position: relative;
             }

                 .chart-container > #Earnings {
                     position: absolute;
                     top: 0;
                     left: 0;
                     width: 100%;
                     height: 100%;
                 }
                 /* Basic Grid Container */
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Responsive columns */
    gap: 20px; /* Space between grid items */
    padding: 20px; /* Padding around grid */
    max-width: 1200px;
    margin: auto; /* Center the grid */
    box-sizing: border-box;
}

/* Grid Item/Card Styling */
.grid-item {
    background: #fff; /* White background */
    border-radius: 12px; /* Rounded corners */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Light shadow */
    padding: 20px; /* Inner padding */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover effect */
    display: block;
    align-items: center;
    justify-content: center;
    font-size: 1.1rem;
    font-weight: 600;
    color: #333;
}

/* Hover effect for grid items */
.grid-item:hover {
    transform: translateY(-5px); /* Lift effect */
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
}

/* Optional responsive font size */
@media (max-width: 600px) {
    .grid-item {
        font-size: 1rem; /* Smaller font size for smaller screens */
    }
}
.imagg {
    border-radius: 50%; /* Make image round */
    width: 100px; /* Adjust size for a consistent circle */
    height: 100px;
    object-fit: cover;
    margin-bottom: 15px;
    padding: 10px;
}
/* Sidebar Styles */
#sidebar {
    background-color: #FEF8F5; /* Light background */
    height: 100vh; /* Full height */
    padding-top: 20px; /* Add space on top */
    position: fixed; /* Fixed sidebar */
    left: 0;
    top: 0;
    width: 250px; /* Width of the sidebar */
    border-right: 2px solid #ddd; /* Border to separate sidebar */
}

.sidebar-header {
    text-align: center; /* Center the title */
    padding: 15px;
    background-color: #38b6f4; /* Sidebar header background */
    color: white; /* White text */
    font-size: 1.5rem;
    font-weight: bold;
    border-bottom: 2px solid #ddd;
}

.nav-pills > li > a {
    padding: 10px 15px;
    color: #333; /* Text color */
    border-radius: 0; /* Remove borders around list items */
    font-size: 16px; /* Font size */
}

.nav-pills > li > a:hover {
    background-color: #38b6f4; /* Hover background color */
    color: white; /* Hover text color */
}

.nav-header {
    font-size: 18px;
    color: #555;
    margin-top: 15px;
    font-weight: bold;
}

/* Adjust the layout for main content */
.col-sm-10 {
    margin-left: 250px; /* Leave space for the sidebar */
    padding: 20px;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    #sidebar {
        width: 100%; /* Full width on smaller screens */
        position: relative;
        height: auto;
    }

    .col-sm-10 {
        margin-left: 0;
    }
}

  
         </style>
    </header>
  <div class="conntaier">
      <div class="header-title">
          <h2>Dashboard</h2>
          <hr/>
      </div>
    
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 side_nav">
      <img src="../../Material/M1PROJECTMATERIAL/INAPPPIC/ProMed-Transparent.png" style="height:150px; width:150px;align-self:center"/>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="../Doctor/PatientInfo"><strong>Dashboard</strong></a></li>
        <li><a href="../Owner/Reports.aspx"><strong>Overview Report</strong></a></li>
      </ul><br>
    </div>

    
    <div class="col-sm-9">
      <div class="well grid-item">
          <div style="display:flex">
              <asp:Image ID="drimage" runat="server" CssClass="imagg" />              
          <h1><asp:Label ID="DrNameLabel" runat="server" Text="Label" Font-Names="Poppins"></asp:Label></h1>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <div class="well grid-item" style="text-align:center">
              <asp:Label ID="lbllblPatientsNo" runat="server" Text="Label" Font-Bold="true"></asp:Label>
             <h3><asp:Label ID="lblPatientsNo" runat="server" Text="Label" Font-Names="Montserrat"></asp:Label></h3>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well grid-item" style="text-align:center">
            <strong><asp:Label ID="lbllblAppointments" runat="server" Text="Label" Font-Bold="true"></asp:Label></strong>
             <h3><asp:Label ID="lblAppointment" runat="server" Text="Label"></asp:Label></h3>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well grid-item" style="text-align:center">
            <asp:Label ID="lbllblDiagnosis" runat="server" Text="Label" Font-Bold="true"></asp:Label>
             <h3><asp:Label ID="lblDiagnosis" runat="server" Text="Label"></asp:Label></h3>
          </div>
        </div>       
      </div>
      <div class="row">
        <div class="col-sm-8">
          <div class="well grid-item" style="text-align:center">
              <div>
                  <p><strong>Earnings in past 30 days</strong></p>
                  <h3><asp:Label ID="lblEarnings" runat="server" Text="Earnings"></asp:Label></h3>
              </div>
              
              <asp:Chart ID="Earnings" runat="server" DataSourceID="DSBar" Palette="None" Height="200px" Width="700px">
    <Series>
        <asp:Series 
            Name="Series1" 
            YValueMembers="TotalEarnings"   
            YValuesPerPoint="2" 
            Legend="Legend1" 
            XValueMember="Month" 
            ChartType="Area" />
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BorderWidth="0">
            
            <AxisX IsLabelAutoFit="False" Title="Months" Minimum="1">
                <LabelStyle Angle="0" Interval="1" />
                <MajorGrid Enabled="False" />
                <MajorTickMark Interval="1" />
            </AxisX>

           
            <AxisY IsLabelAutoFit="True" Title="Earnings">
                <MajorGrid Enabled="True" />
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>



              <asp:SqlDataSource runat="server" ID="DSBar" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(Amount_Paid) AS TotalEarnings FROM Appointment_Correct WHERE Doctor_ID = @DoctorId GROUP BY YEAR(Date), MONTH(Date) ORDER BY Year, Month">
                  <SelectParameters>
                      <asp:SessionParameter SessionField="Doctor_ID" Name="DoctorId"></asp:SessionParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
          </div>
        </div>
        
        <div class="col-sm-4">
          <div class="well grid-item" style="text-align:center">
              <p><strong>Male to Female ratio</strong></p>
              <asp:SqlDataSource runat="server" ID="DSPie" 
    ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' 
    SelectCommand="SELECT Patient.Patient_Sex, COUNT(*) AS Count 
                   FROM Appointment_Correct 
                   INNER JOIN Patient ON Appointment_Correct.Patient_ID = Patient.Patient_Id 
                   WHERE (Appointment_Correct.Doctor_ID = @DoctorId) 
                   GROUP BY Patient.Patient_Sex">
    <SelectParameters>
        <asp:SessionParameter SessionField="Doctor_ID" Name="DoctorId"></asp:SessionParameter>
    </SelectParameters>
</asp:SqlDataSource>

<asp:Chart ID="PieChart" runat="server" DataSourceID="DSPie" Height="250px" Palette="None">
    <Series>
        <asp:Series Name="Series1" ChartType="Pie" 
                     XValueMember="Patient_Sex" YValueMembers="Count" Palette="None">
            <Points>
                <asp:DataPoint Color="#38b6f4" LegendText="Male" Font="Arial"/>   
                <asp:DataPoint Color="#ff66b2" LegendText="Female" Font="Arial"/> 
            </Points>
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
    </ChartAreas>
    <Legends>
        <asp:Legend Name="GenderLegend" IsTextAutoFit="False" Font="Arial, 9.75pt" />
    </Legends>
</asp:Chart>

          </div>
        </div>
      </div>
      
    </div>
  </div>
</div>
      </div>

</asp:Content>
