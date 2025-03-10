<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="prohealth.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
      
            <script>
                $(document).ready(function() {
                    $('.col-sm-8').addClass('fade-in');
                });
    </script>
       
        <style>
            
       /* @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .fade-in {
            animation: fadeIn 1s ease-in;
        }*/
    
        </style>
        

    </header>
    <div class="conntainer">
        <div class="carousel-inner">
            <div class="item active">
                <img src="Material/M1PROJECTMATERIAL/INAPPPIC/About us banner.png" alt="About" style="width: 100%; height: 80%;">
            </div>
        </div>
    <div> &nbsp</div>
   
  <div class="row">
    <div class="col-sm-4">
      <img src="Material/M1PROJECTMATERIAL/INAPPPIC/ProMed-Transparent.png" width="300px" height="300px">
    </div>
    <div class="col-sm-8">
      <h2>About us</h2>
      <p>The chosen client is a Private Medical Clinic, located in KwaMashu, North of Durban. The clinic consists of a General Practitioner, Dentist, Psychologist, Radiographer, and Dietician. The Clinic is well-established and sees at least 50 patients daily with a Patient base ranging from the young to the elderly. 
 The clinic's main source of revenue is by collection of consultation fees, medical procedure fees, and the dispensation of medication.</p>
    </div>
  </div>

   <%-- <div class="container-fluid bg-2 text-center" style="background-color: blue;">
    <h3>What Am I?</h3>
    <p>Lorem ipsum..</p>
    <a href="#" class="btn btn-default btn-lg">Search</a>
  </div> --%>
    <div> &nbsp</div>
     
    <div class="container">
  <section class="team-section">
    <div class="team-title">
        <h1 style="text-align:center">Our Team</h1>
    </div>

    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="team-card">
                <div class="team-image">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" />
                </div>
                <div class="team-detail">
                    <h3>Siphilele</h3>
                    <p>Designer</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="team-card">
                <div class="team-image">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" />
                </div>
                <div class="team-detail">
                    <h3>Siphilele</h3>
                    <p>Designer</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="team-card">
                <div class="team-image">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" />
                </div>
                <div class="team-detail">
                    <h3>Siphilele</h3>
                    <p>Designer</p>
                </div>
            </div>
        </div> 
        </div>
</section>
    </div>

    <div class="container bg-grey">
  <div class="row">
    <div class="col-sm-8">
      <h2>About Company Page</h2>
      <h4>Lorem ipsum..</h4>
      <p>Lorem ipsum..</p>
      <button class="btn btn-default btn-lg">Get in Touch</button>
    </div>
    <div class="col-sm-4">
      <img src="Material/M1PROJECTMATERIAL/INAPPPIC/cartoon doctor.png" height="250px" width="250px"></img>
    </div>
  </div>
</div>

<div class="container bg-grey">
  <div class="row">
    <div class="col-sm-8">
      <img src="Material/M1PROJECTMATERIAL/INAPPPIC/hospital_sign-removebg-preview.png" height="250px" width="250px"></img>
    </div>
    <div class="col-sm-4">
      <h2>Our Values</h2>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>
      <p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
    </div>
  </div>
</div>
</div>
     
    
</asp:Content>
