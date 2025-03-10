<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="prohealth.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <header>
        <script>
            function showAppointmentDialog() {
                // Open the dialog when the button is clicked
                $("#appointmentDialog").dialog("open");
            }
        </script>
    </header>
    <div>&nbsp</div>
    <h2><%: Title %>.</h2>
    <div class="conntainer">
    <div class="row">
        <div class="col-md-8">
            <asp:PlaceHolder id="loginForm" runat="server">
                <div class="form-horizontal">
                    <h4>Forgot your password?</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                        <div class="search-container col-md-10">                           
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div>
                            <asp:Button runat="server" OnClick="SendLinkButton_Click" Text="Email Link" CssClass="modern-btn" />
                            <asp:Label ID="SuccessMessage" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                <p class="text-info">
                    Please check your email to reset your password.
                </p>
            </asp:PlaceHolder>
            
        </div>
    </div>
        </div>
     <div id="EmailModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Reset link has been sent to your email.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="modern-btn" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>
