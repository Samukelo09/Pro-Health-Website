<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="prohealth.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>&nbsp</div>

    <header>
        <style>
           
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .flex {
                display: flex;
                align-items: center;
            }

            .container {
                padding: 0 15px;
                min-height: 100vh;
                justify-content: center;
                /*background: #f0f2f5;*/
            }

            .facebook-page {
                justify-content: space-between;
                max-width: 1000px;
                width: 100%;
            }

                .facebook-page .text {
                    margin-bottom: 90px;
                }

                .facebook-page h1 {
                    
                    color: #38b6f4;
                    font-size: 4rem;
                    margin-bottom: 10px;
                }

                .facebook-page p {
                    
                    white-space: nowrap;
                }

            .formm {
                display: flex;
                flex-direction: column;
                background: #fff;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 8px 16px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

                .formm .innput {
                    height: 55px;
                    width: 100%;
                    border: 1px solid #ccc;
                    border-radius: 6px;
                    margin-bottom: 15px;
                    
                    padding: 0 14px;
                }

                    .formm .innput:focus {
                        outline: none;
                        border-color: #38b6f4;
                    }

            ::placeholder {
                color: #777;
                
            }

            .link {
                display: flex;
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }

                .link .login {
                    border: none;
                    outline: none;
                    cursor: pointer;
                    background: #38b6f4;
                    padding: 15px 0;
                    border-radius: 6px;
                    color: #fff;
                    
                    font-weight: 600;
                    transition: 0.2s ease;
                }

                    .link .login:hover {
                        background: #38b6f4;
                    }

            form a {
                text-decoration: none;
            }

            .link .forgot {
                color: #38b6f4;
                font-size: 0.875rem;
            }

                .link .forgot:hover {
                    text-decoration: underline;
                }

            hr {
                border: none;
                height: 1px;
                background-color: #ccc;
                margin-bottom: 20px;
                margin-top: 20px;
            }

            .button {
                margin-top: 25px;
                text-align: center;
                margin-bottom: 20px;
            }

                .button a {
                    padding: 15px 20px;
                    background: #42b72a;
                    border-radius: 6px;
                    color: #fff;
                    
                    font-weight: 600;
                    transition: 0.2s ease;
                }

                    .button a:hover {
                        background: #3ba626;
                    }

            @media (max-width: 900px) {
                .facebook-page {
                    flex-direction: column;
                    text-align: center;
                }

                    .facebook-page .text {
                        margin-bottom: 30px;
                    }
            }

            @media (max-width: 460px) {
                .facebook-page h1 {
                    font-size: 3.5rem;
                }

                .facebook-page p {
                    font-size: 1.3rem;
                }

                .formm {
                    padding: 15px;
                }
            }
            .gradient-text {
    font-size: 2em;
    font-weight: bold;
    /* Step 1: Create the gradient */
    background-image: linear-gradient(135deg, #38b6f4, #094074);;
    /* Step 2: Use the gradient as a background for the text */
    background-clip: text;
    /* Step 3: Make the text itself transparent to show the background */
    -webkit-background-clip: text;
    color: transparent;
    /* Ensures compatibility across browsers */
    -webkit-text-fill-color: transparent;
}

        </style>
    </header>

<div class="conntainer">
    <div class="container flex">
      <div class="facebook-page flex">
        <div class="text">
          <h1 class="gradient-text">Prohealth Medical</h1>
          <p>Providing Healthcare</p>
          <p>at an affordable price.</p>
        </div>
        <div class="formm">
          <asp:TextBox runat="server" ID="Email" TextMode="Email" CssClass="innput" Placeholder="Email"/>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." />
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="innput" Placeholder="Password"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                <div>
                    
            <asp:CheckBox runat="server" ID="RememberMe" Text="  Remember Me"/>
                </div>
             <div class="link">
            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="modern-btn"/>
            <a href="Forgot.aspx" class="forgot">Forgot password?</a>
          </div>
          <hr>
          <div class="button">
            <asp:HyperLink ID="register" runat="server" NavigateUrl="~/Account/Register.aspx">Register new user</asp:HyperLink>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
          </div>
        </div>
      </div>  
    </div>
    </div>




              <!--  <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p> 

       <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div> -->
</asp:Content>
