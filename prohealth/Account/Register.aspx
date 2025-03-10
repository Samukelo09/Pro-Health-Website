<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="prohealth.Account.Register" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <header>

    <script>
        $(document).ready(function () {
            $('#found_site').on('change', function () {
                $(this).val() == "other" ? $('#specify').closest('.form-group').show() : $('#specify').closest('.form-group').hide();
            })
        })

        src = "https://code.jquery.com/jquery-3.6.0.min.js"

        function validateName() {
            var name = document.getElementById('<%= Name.ClientID %>').value;
        var errorSpan = document.getElementById('nameError');

        // Allow only alphabetic characters and ensure the first letter is uppercase
        name = name.replace(/[^a-zA-Z\s]/g, ''); // Remove any non-alphabetic characters
        name = name.replace(/\b\w/g, function(char) { return char.toUpperCase(); }); // Capitalize the first letter of each word

            document.getElementById('<%= Name.ClientID %>').value = name; // Update the textbox value

            // Check if Name field is empty or contains non-alphabetic characters
            if (name.trim() === "") {
                errorSpan.style.display = "inline";
            } else {
                errorSpan.style.display = "none";
            }
        }
        function validateSurname() {
            var surname = document.getElementById('<%= Surname.ClientID %>').value;
        var errorSpan = document.getElementById('surnameError');

        // Allow only alphabetic characters and ensure the first letter is uppercase
        surname = surname.replace(/[^a-zA-Z\s]/g, ''); // Remove any non-alphabetic characters
        surname = surname.replace(/\b\w/g, function(char) { return char.toUpperCase(); }); // Capitalize the first letter of each word

            document.getElementById('<%= Surname.ClientID %>').value = surname; // Update the textbox value

            // Check if Surname field is empty or contains non-alphabetic characters
            if (surname.trim() === "") {
                errorSpan.style.display = "inline";
            } else {
                errorSpan.style.display = "none";
            }
        }
        function validateEmail() {
            var email = document.getElementById('<%= Email.ClientID %>').value;
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
        function showAppointmentDialog() {
            // Open the dialog when the button is clicked
            $("#appointmentDialog").dialog("open");
        }
        
    
    </script>
        <style>
           
        </style>

</header>  
    <div class="conntainer">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div>&nbsp</div>
   
       <div class="row">
           <div class="col-md-8 col-md-offset-2">
               

                    <h1 class="text-center">Register</h1>

                    <fieldset>
                        <legend>Personal Details</legend>

                        <div class="input-container col-md-10">
                            <asp:Label runat="server" AssociatedControlID="Name">Name *</asp:Label>
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" oninput="validateName()"/>                           
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Name" runat="server" ErrorMessage="RequiredFieldValidator" CssClass="error-message"></asp:RequiredFieldValidator>
                            <span id="nameError" class="error-message" style="color: red; display: none;">Name is required and must only contain alphabets.</span>
                        </div>
                       
                        <div class="input-container col-md-10">
                            <asp:Label runat="server" AssociatedControlID="Surname">Surname *</asp:Label>
                            <asp:TextBox runat="server" ID="Surname" CssClass="form-control" TextMode="SingleLine" oninput="validateSurname()" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Surname" runat="server" ErrorMessage="RequiredFieldValidator" CssClass="error-message"></asp:RequiredFieldValidator>
                            <span id="surnameError" class="error-message" style="color: red; display: none;">Surname is required and must only contain alphabets.</span>
                        </div>
                       
                        <div class="input-container col-md-10">
                        <asp:Label runat="server" AssociatedControlID="Number">Phone Number *</asp:Label>
                        <asp:TextBox runat="server" ID="Number" CssClass="form-control" TextMode="Phone"/> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Surname" runat="server" ErrorMessage="RequiredFieldValidator" CssClass="error-message"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="PhoneValidator" runat="server"
                                ControlToValidate="Number"
                                ValidationExpression="^0(6|7|8|9)\d{8}$"
                                ErrorMessage="Enter a valid South African phone"
                                ForeColor="Red" Display="Dynamic" CssClass="error-message"/>                         
                        </div>
                      
                        <div class="input-container col-md-10">
                            <asp:Label runat="server" AssociatedControlID="Email">Email *</asp:Label>
                            <asp:TextBox runat="server" ID="Email" oninput="validateEmail()" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="error-message" ErrorMessage="The email field is required." />
                           <span id="emailError" class="error-message" style="color: red; display: none;">Please enter a valid email address.</span>
                        </div>
                       
                        <div class="input-container col-md-10">
                            <asp:Label runat="server" AssociatedControlID="Password">Password *</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="error-message" ErrorMessage="The password field is required." />
                            <asp:RegularExpressionValidator runat="server"
                                ID="PasswordRegexValidator"
                                ControlToValidate="Password"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$"
                                ErrorMessage="Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character."
                                ForeColor="Red" Display="Dynamic" CssClass="error-message" />
                           
                        </div>
                        <div>&nbsp</div>
                        <div class="input-container col-md-10">
                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password *</asp:Label>
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="error-message" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="error-message" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        </div>
                        
                        <div class="search-container col-md-12">
                            <asp:Label runat="server" AssociatedControlID="DOB">Date Of Birth *</asp:Label>
                            <asp:TextBox runat="server" ID="DOB" TextMode="Date" CssClass="form-control"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                                CssClass="error-message" ErrorMessage="Select date of birth."/>
                        </div>    
                        <div class="search-container col-md-8">
                            <asp:Label ID="Label1" AssociatedControlID="RadioButtonListSex" runat="server" Text="Sex"></asp:Label>
                            <asp:RadioButtonList ID="RadioButtonListSex" runat="server">
                                <asp:ListItem Text=" Male" Value="Male" />
                                <asp:ListItem Text=" Female" Value="Female" />
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="RadioButtonListSex" runat="server" ErrorMessage="Sex field required." CssClass="error-message"></asp:RequiredFieldValidator>
                            </div>
                    </fieldset>
              
                                       
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn modern-btn" OnClientClick="showAppointmentDialog()"/>
                            <a href="Login.aspx">Already have an account?</a>
                        </div>
                    </div>
               

            </div>

        </div>
        
    </div>
    <div id="ErrorModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Registration Erros</h4>
            </div>
            <div class="modal-body">
                <p>"A patient with this email already exists. Please try to login."</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="modern-btn" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

    
 
</asp:Content>
