<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="prohealth.Private.Owner.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
        /* Optional: Style the iframe container */
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
    </style>
        
    </header>
    <div class="conntainer">
    <h1>Summary Reports</h1>
        
    <iframe class="iframe-container" title="ProHealth Reports" src="https://app.powerbi.com/view?r=eyJrIjoiMGY4MWVhZWItYTVmNC00YmFiLWI4ZTgtY2Y0YjhlNjIxYzZmIiwidCI6IjIyNjgyN2Q2LWE5ZDAtNDcwZC04YzE1LWIxNDZiMDE5MmQ1MSIsImMiOjh9" frameborder="0"></iframe>
        <div>

        </div>
        </div>
</asp:Content>
