<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDetails.aspx.cs" Inherits="prohealth.Private.ManageDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>&nbsp</div>
    <header>
    <script>
        function validateName() {
            var name = document.getElementById('<%= txtName.ClientID %>').value;
            var errorSpan = document.getElementById('nameError');

            // Allow only alphabetic characters and ensure the first letter is uppercase
            name = name.replace(/[^a-zA-Z\s]/g, ''); // Remove any non-alphabetic characters
            name = name.replace(/\b\w/g, function (char) { return char.toUpperCase(); }); // Capitalize the first letter of each word

            document.getElementById('<%= txtName.ClientID %>').value = name; // Update the textbox value

            // Check if Name field is empty or contains non-alphabetic characters
            if (name.trim() === "") {
                errorSpan.style.display = "inline";
            } else {
                errorSpan.style.display = "none";
            }
        }
        function validateSurname() {
            var surname = document.getElementById('<%= txtLastName.ClientID %>').value;
        var errorSpan = document.getElementById('surnameError');

        // Allow only alphabetic characters and ensure the first letter is uppercase
        surname = surname.replace(/[^a-zA-Z\s]/g, ''); // Remove any non-alphabetic characters
        surname = surname.replace(/\b\w/g, function(char) { return char.toUpperCase(); }); // Capitalize the first letter of each word

            document.getElementById('<%= txtLastName.ClientID %>').value = surname; // Update the textbox value

            // Check if Surname field is empty or contains non-alphabetic characters
            if (surname.trim() === "") {
                errorSpan.style.display = "inline";
            } else {
                errorSpan.style.display = "none";
            }
        }
        function validateEmail() {
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var emailError = document.getElementById('emailError');

            // Regular expression for validating email format
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            // Check if email matches the pattern
            if (emailPattern.test(email)) {
                emailError.style.display = "none";
                email.style.border = "1px solid red";
            } else {
                emailError.style.display = "inline";
            }
        }
    </script>
    </header>    
        <div class="conntainer">           
                <div class="row">                    
                    <div class="col-md-8 col-md-offset-2">                                                  
                            <div class="header-title">
                                <h1>Manage Information</h1>
                                <hr />
                                <h4>Add and update information</h4>
                            </div>
                        <fieldset>
                            <div class="input-container col-md-6">
                                    <asp:Label AssociatedControlID="txtName" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control" oninput="validateName()"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" CssClass="error-message"></asp:RequiredFieldValidator>
                                <span id="nameError" class="error-message" style="color: red; display: none;">Name is required and must only contain alphabets.</span>
                                </div>
                            <div class="input-container col-md-6">
                                <asp:Label AssociatedControlID="txtLastName" runat="server" Text="Surname"></asp:Label>
                                <asp:TextBox ID="txtLastName" oninput="validateSurname()" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>                               
                                <span id="surnameError" class="error-message" style="color: red; display: none;">Surname is required and must only contain alphabets.</span>
                                <asp:RegularExpressionValidator
                                    ID="NameRegexValidator"
                                    runat="server"
                                    ControlToValidate="txtLastName"
                                    ErrorMessage="Only letters are allowed, and the first letter must be uppercase."
                                    ValidationExpression="^[A-Z][a-zA-Z]*$"
                                    ForeColor="Red" CssClass="error-message"/>

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
                                    <asp:TextBox ID="txtEmail" oninput="validateEmail()" runat="server" TextMode="SingleLine" Required="true" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server"
                                        ControlToValidate="txtEmail"
                                        ErrorMessage="Email is required."
                                        ForeColor="Red" />
                                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server"
                                        ControlToValidate="txtEmail"
                                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                                        ErrorMessage="Invalid email format."
                                        ForeColor="Red" CssClass="error-message"/>
                                    <span id="emailError" class="error-message" style="color: red; display: none;">Please enter a valid email address.</span>
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
        <div id="confirmationModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Your details have been successfully captured!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="modern-btn" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>                                  
                        
</asp:Content>
