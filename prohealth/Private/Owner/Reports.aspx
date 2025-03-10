<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="prohealth.Private.Owner.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
        
        .iframe-container {
            position: relative;
            width: 100%;
            height: 800px; /* Adjust height as needed */
            overflow: hidden;
        }
        iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none; /* Remove iframe border */
        }
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
    <div class="conntainer">
        <div class="header-title">
    <h2>Summary Reports</h2>
            <hr />
            </div>
        <div class="container-fluid">
  <div class="row content">
      <div>
    <div class="col-sm-2 side_nav">
      <img src="../../Material/M1PROJECTMATERIAL/INAPPPIC/ProMed-Transparent.png" style="height:150px; width:150px;align-self:center" />
      <ul class="nav nav-pills nav-stacked">
        <li><a href="../Doctor/PatientInfo"><strong>Dashboard</strong></a></li>
        <li><a href="../Owner/Reports.aspx"><strong>Overview Report</strong></a></li>
      </ul><br>
    </div>
          </div>
    <br> 
      <div class="col-sm-9">
    <iframe class="iframe-container" title="ProHealth Reports" src="https://app.powerbi.com/view?r=eyJrIjoiNGY3YzdlNGQtM2NhYS00NGQ1LWJhZGUtNTRhZTUyZTRiNmI2IiwidCI6IjIyNjgyN2Q2LWE5ZDAtNDcwZC04YzE1LWIxNDZiMDE5MmQ1MSIsImMiOjh9" frameborder="0"></iframe>
        
        </div>
            </div>
        </div>
    </div>
    
</asp:Content>
