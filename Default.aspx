<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="prohealth._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <!-- animation slidein -->
            <script>
                $(document).ready(function() {
                    $('.container').addClass('fade-in');
                });
    </script>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .fade-in {
            animation: fadeIn 2s ease-in;
        }
        
    
    .row {
        padding: 20px;
    }
    img{
        width: 20px;
        height: 20px;
        
    }
    /* Testimonials Section */
     .testimonials {
          padding: 40px 0;
        
          text-align: center;
     }
 
      .testimonials h2 {
    margin-bottom: 30px;
    
}
 
.testimonial-card {
    padding: 20px;
    border-radius: 10px;
    background-color: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}
 
.testimonial-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
}
 
/* Rounded Image Styling */
.testimonial-card img {
    border-radius: 50%; /* Make image round */
    width: 100px; /* Adjust size for a consistent circle */
    height: 100px;
    object-fit: cover;
    margin-bottom: 15px;
}
.testimonial-cardd img {
     /* Make image round */
    width: 100px; /* Adjust size for a consistent circle */
    height: 100px;
    object-fit: cover;
    margin-bottom: 15px;
}

    </style>    
</header>
    
   <div class="carousel-inner">
      <div class="item active">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/website home banner (1).svg" alt="About" style="width:100%; height:100%;">
      </div>
       </div>
    <hr />
    <div class="jumbotronn">       
        <h1 style="text-align:center">Get the care you need. With our doctors</h1>
        <h2><a href="Private/addappointment.aspx" class="modern-btn" style="font-size:large">Book Appointment &raquo;</a></h2>
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
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/favorite_24dp_000000_FILL1_wght0_GRAD0_opszNaN.svg" />
        <h4>LOVE</h4>
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
      <div class="col-sm-4">
        <img src="/pics/heart-pulse-svgrepo-com.svg"/>
        <h4>RESPECT</h4>
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
    </div>
    <br><br>
    <div class="row">
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/loyalty_24dp_000000_FILL1_wght0_GRAD0_opsz24.svg" />
        <h4>LOYALTY</h4>
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
      <div class="col-sm-4">
        <img src="/pics/heart-pulse-svgrepo-com.svg"/>
        <h4>PATIENCE</h4>
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
      <div class="col-sm-4">
        <img src="Material/M1PROJECTMATERIAL/icons/work_24dp_000000_FILL1_wght0_GRAD0_opsz24.svg" />
        <h4>HARD WORK</h4>
        <p>Lorem ipsum dolor sit amet..</p>
      </div>
    </div>
        </div>

  
    <div class="row">
        <!-- Testimonials Section -->
    <div class="testimonials container">
        <h2 class="text-center">What Our Patients Say</h2>
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/chelsea-fern-r_-M00daj2Y-unsplash.jpg" alt="Testimonial 1" />
                    <p>"We had an amazing stay at Cathedral Peak Hotel! The staff were incredibly friendly and the service was top-notch."</p>
                    <p><strong>- John Doe</strong></p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/christina-wocintechchat-com-Zpzf7TLj_gA-unsplash.jpg" alt="Testimonial 2" />
                    <p>"The hotel was beautiful and the rooms were so comfortable. We can't wait to come back!"</p>
                    <p><strong>- Jane Smith</strong></p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="testimonial-card">
                    <img src="Material/M1PROJECTMATERIAL/INAPPPIC/judeus-samson-NqzPPiRP5ew-unsplash.jpg" alt="Testimonial 3" />
                    <p>"An unforgettable experience! The scenery was breathtaking, and the food was exquisite."</p>
                    <p><strong>- Michael Brown</strong></p>
                </div>
            </div>
        </div>
    </div>
</div>
        
</asp:Content>
