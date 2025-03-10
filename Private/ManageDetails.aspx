<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDetails.aspx.cs" Inherits="prohealth.Private.ManageDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>&nbsp</div>
    <header>
    
    </header>    
        <div class="conntainer">           
                <div class="row">                    
                    <div class="col-md-8 col-md-offset-2">                                                  
                            <div class="text">
                                <h1>Manage Information</h1>
                                <hr />
                                <h4>Add and update information</h4>
                            </div>
                        <fieldset>
                            <div class="input-container col-md-6">
                                    <asp:Label AssociatedControlID="txtName" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>
                                    
                                </div>
                                <div class="input-container col-md-6">
                                    <asp:Label AssociatedControlID="txtLastName" runat="server" Text="Surname"></asp:Label>
                                    <asp:TextBox ID="txtLastName" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NameRequired" runat="server" ControlToValidate="txtLastName" ErrorMessage="Name is required."  ForeColor="Red" />
                                </div>
                            
                            <div class="input-container col-md-6">
                                <asp:Label AssociatedControlID="txtPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="PhoneValidator" runat="server"
                                    ControlToValidate="txtPhoneNumber"
                                    ValidationExpression="^0(6|7|8|9)\d{8}$"
                                    ErrorMessage="Enter a valid South African phone number (10 digits, starting with 0)."
                                    ForeColor="Red" />
                                </div>
                                <div class="input-container col-md-6">
                                    <asp:Label AssociatedControlID="txtEmail" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server"
                                        ControlToValidate="txtEmail"
                                        ErrorMessage="Email is required."
                                        ForeColor="Red" />
                                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server"
                                        ControlToValidate="txtEmail"
                                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                                        ErrorMessage="Invalid email format."
                                        ForeColor="Red" />
                                </div>
                            
                            <div class="input-container col-md-6">
                                <asp:Label AssociatedControlID="txtDateOfBirth" runat="server" Text="Date of birth"></asp:Label>
                                    <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" Required="true" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    
                                </div>
                                <div class="input-container col-md-6">
                                    <asp:Label AssociatedControlID="txtSex" runat="server" Text="Sex"></asp:Label>
                                    <asp:TextBox ID="txtSex" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control" Enabled="false"></asp:TextBox>
                                   
                                </div>                                
                            
                        <asp:Label ID="StatusLabel" runat="server" CssClass="status-message"></asp:Label>
                            <div class="col-sm-12 buttons">
                                <asp:Button ID="btnAcceptChanges" runat="server" Text="Accept Changes" CssClass="btn modern-btn" OnClick="btnUpdate_Click"/>
                            </div>
                            </fieldset>
                        </div>
                    </div>
            
    </div>
                                          
                        
</asp:Content>
