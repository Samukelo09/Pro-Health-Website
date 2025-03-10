<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="prohealth._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <!-- animation slidein -->
        <script>
            $(document).ready(function () {
                $('.container').addClass('fade-in');
            });
        </script>
        <style>
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            .fade-in {
                animation: fadeIn 2s ease-in;
            }


          
            h1 {
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
        }

        
        h2 {
            font-family: 'Raleway', sans-serif;
            font-weight: 600;
        }

        h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 500;
        }

        
        h4 {
            font-family: 'Roboto', sans-serif;
            font-weight: 400;
        }

       
        p, span {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
        }
        /* Basic horizontal line with primary color */
.hr-basic {
    border: 0;
    height: 2px;
    background-color: #38b6f4; /* Your primary color */
    margin: 20px 0;
}

/* Gradient horizontal line */
.hr-gradient {
    border: 0;
    height: 1px;
    background: linear-gradient(to right, #38b6f4, #1e88e5); /* Customize colors */
    margin: 20px 0;
}

/* Dashed horizontal line */
.hr-dashed {
    border: 0;
    border-top: 2px dashed #38b6f4;
    margin: 20px 0;
}

/* Dotted horizontal line */
.hr-dotted {
    border: 0;
    border-top: 2px dotted #38b6f4;
    margin: 20px 0;
}

/* Double line with padding */
.hr-double {
    border: 0;
    border-top: 3px double #38b6f4;
    margin: 20px 0;
}

/* Horizontal line with centered text */
.hr-with-text {
    display: flex;
    align-items: center;
    text-align: center;
    margin: 20px 0;
}

.hr-with-text::before,
.hr-with-text::after {
    content: "";
    flex: 1;
    border-bottom: 2px solid #38b6f4;
}

.hr-with-text span {
    padding: 0 15px;
    color: #38b6f4;
    font-weight: bold;
    font-size: 1.1em;
}

        </style>    
</header>
    
   <div class="carousel-inner" >
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/website home banner (1).svg" alt="About" style="width:100%; height:100%;"> 
    <div >
    <div class="jumbotronn">       
        <h1 style="text-align:center">Get the care you need. With our doctors</h1>
        <h2><a href="Private/addappointment.aspx" class="modern-btn" style="font-size:large">Book Appointment &raquo;</a></h2>
    </div>
        </div>
       </div>
    <hr />

    <!--Services-->
  
    <div class="testimonials container">
    <h2 class="text-center">Our services</h2>
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/icons/pills-svgrepo-com.svg"/>               
                <p><strong>Replenish medicine</strong></p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/icons/medicine-svgrepo-com (1).svg" />             
                <p><strong>Book check ups and follow ups</strong></p>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/icons/first-aid-kit-svgrepo-com.svg" />              
                <p><strong>Buy first aid</strong></p>
            </div>
        </div>
    </div>
</div>
    <!-- values -->

    <div class="container-fluid text-center" style="background-color: #f0f2f5">
       <div>&nbsp</div> 
    <h2>Values</h2>
    
    <br>
    <div class="row">
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/volunteer_activism_24dp_000000_FILL1_wght0_GRAD0_opsz24.svg" />
        <h4>CARE</h4>
     
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/favorite_24dp_000000_FILL1_wght0_GRAD0_opszNaN.svg" />
        <h4>LOVE</h4>
        
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/cheer_24dp_00000_FILL0_wght400_GRAD0_opsz24.svg"/>
        <h4>RESPECT</h4>
        
      </div>
    </div>
    <br><br>
    <div class="row">
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/sentiment_very_satisfied_24dp_00000_FILL1_wght400_GRAD0_opsz24.svg" />
        <h4>CUSTOMER SATISFACTION</h4>
       
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/stethoscope_24dp_00000_FILL1_wght400_GRAD0_opsz24.svg"/>
        <h4>AFFORDABLE HEALTH CARE</h4>
        
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/work_24dp_000000_FILL1_wght0_GRAD0_opsz24.svg" />
        <h4>HARD WORK</h4>
        
      </div>
    </div>
        </div>

  <div style="background-color:#F4F2EF">
    <div class="row">
        <!-- Testimonials Section -->
    <div class="testimonials container">
        <h2 class="text-center">What Our Patients Say</h2>
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/chelsea-fern-r_-M00daj2Y-unsplash-1.jpg" alt="Testimonial 1" />
                    <p>"The staff were incredibly friendly and the service was top-notch."</p>
                    <p><strong>- John Doe</strong></p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/christina-wocintechchat-com-Zpzf7TLj_gA-unsplash.jpg" alt="Testimonial 2" />
                    <p>"I went there to get my medicine and the nurses there were so helpful"</p>
                    <p><strong>- Jane Smith</strong></p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/judeus-samson-NqzPPiRP5ew-unsplash.jpg" alt="Testimonial 3" />
                    <p>"An unforgettable experience! The doctors really cared about my wellbeing and did followups on my progress"</p>
                    <p><strong>- Michael Brown</strong></p>
                </div>
            </div>
        </div>
    </div>
</div>
       </div> 
</asp:Content>
