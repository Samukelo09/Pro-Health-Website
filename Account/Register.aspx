<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="prohealth.Account.Register" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <header>
    <script>
        $(document).ready(function () {
            $('#found_site').on('change', function () {
                $(this).val() == "other" ? $('#specify').closest('.form-group').show() : $('#specify').closest('.form-group').hide();
            })
        })
    </script>
        <style>
            form * {
                border-radius: 0 !important;
            }

            form > fieldset > legend {
                font-size: 120%;
            }

            .modern-textbox {
                width: 100%;
                max-width: 400px;
                padding: 12px 16px;
                font-size: 16px;
                font-family: Arial, sans-serif;
                color: #333;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 6px;
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }


                .modern-textbox::placeholder {
                    color: #aaa;
                }


                .modern-textbox:focus {
                    border-color: #66afe9;
                    outline: none;
                    box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
                    background-color: #fff;
                }
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

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="Name">Name *</asp:Label>
                            <asp:TextBox runat="server" ID="Name" CssClass="modern-textbox" TextMode="SingleLine"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="Name"
                                ErrorMessage="Name is required."
                                ForeColor="Red" />
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="Surname">Surname *</asp:Label>
                            <asp:TextBox runat="server" ID="Surname" CssClass="modern-textbox" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="Surname"
                                ErrorMessage="Surname is required."
                                ForeColor="Red" />
                        </div>

                        <div class="form-group col-md-6">
                        <asp:Label runat="server" AssociatedControlID="Number">Phone Number *</asp:Label>
                        <asp:TextBox runat="server" ID="Number" CssClass="form-control" TextMode="Phone" />
                            
                            <asp:RegularExpressionValidator ID="PhoneValidator" runat="server"
                                ControlToValidate="Number"
                                ValidationExpression="^0(6|7|8|9)\d{8}$"
                                ErrorMessage="Enter a valid South African phone number (10 digits, starting with 0)."
                                ForeColor="Red" />
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="Email">Email *</asp:Label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                           
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="Password">Password *</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password *</asp:Label>
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        </div>
                        <div class="form-group col-md-12">
                            <asp:Label runat="server" AssociatedControlID="DOB">Date Of Birth *</asp:Label>
                            <asp:TextBox runat="server" ID="DOB" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DOB"
                                CssClass="text-danger" ErrorMessage="Select date of birth." />
                        </div>
                    
                    
                    
                        
                        <div class="form-group col-md-8">
                            <asp:Label ID="Label1" AssociatedControlID="RadioButtonListSex" runat="server" Text="Sex"></asp:Label>
                            <asp:RadioButtonList ID="RadioButtonListSex" runat="server">
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                            </asp:RadioButtonList>
                            </div>
                    </fieldset>

                                       
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn modern-btn" />
                            <a href="Login.aspx">Already have an account?</a>
                        </div>
                    </div>

            </div>

        </div>
    </div>

    
 
</asp:Content>
