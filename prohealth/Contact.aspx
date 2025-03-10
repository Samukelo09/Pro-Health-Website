<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="prohealth.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <style>
            /* Container for hero section with full-screen background */
.hero-container {
    position: relative;
    width: 100%;
    height: 50vh; /* Adjust height as needed */
    background-image: url('Material/M1PROJECTMATERIAL/INAPPPIC/contact us banner (1).png'); /* Replace with your image */
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
   
    text-align: center;
}

/* Dark overlay for better readability */
.hero-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Content inside the hero section */
.hero-content {
    z-index: 1; /* Ensure content is on top of overlay */
    max-width: 600px;
    padding: 20px;
}

/* Title styling */
.hero-title {
    font-size: 2.5em;
    font-weight: bold;
    color: #38b6f4; /* Primary color */
    margin-bottom: 10px;
}

/* Subtitle styling */
.hero-subtitle {
    font-size: 1.2em;
    color: #ffffff;
    margin-bottom: 20px;
}

/* Button styling */
.hero-button {
    display: inline-block;
    padding: 12px 24px;
    background-color: #38b6f4; /* Primary color */
    color: #ffffff;
    font-weight: bold;
    border-radius: 25px;
    text-decoration: none;
    transition: background-color 0.3s;
}

.hero-button:hover {
    background-color: #1e88e5; /* Slightly darker shade for hover */
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .hero-title {
        font-size: 2em;
    }

    .hero-subtitle {
        font-size: 1em;
    }

    .hero-container {
        height: 60vh;
    }
}
.vertical {
            border-left: 4px solid black;
            height: 50px;
        }
        </style>
    </header>
    
        <div class="hero-container">          
    <div class="hero-overlay">
        <div class="hero-content">
            <h1 class="gradient-text">Contact us</h1>
            <h3 class="hero-subtitle">Need expert medical help at an affordable price? Contact us and we will respond.</h3>
            <a href="About.aspx" class="modern-btn">Learn More</a>
        </div>
    </div>
</div>
 
    <div style="background-color:#F5FBFE">
    <div class="testimonials container" >
    <h2 class="text-center">Get in touch with us</h2>
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/INAPPPIC/home_health_100dp_38B3F4_FILL1_wght400_GRAD0_opsz48.svg"/>               
                <p><strong>Visit us</strong></p>
                <address>
                    Nyala Mall<br />
                    201 Nyala Road, KwaMashu L, 4359<br />
                    <p><strong>Opeating Hours</strong></p>
                    <p>Monday - Sunday</p>
                    <p>08:00 - 17:00</p>
                </address>
            </div>
        </div>
        
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/icons/call_100dp_38B3F4_FILL1_wght400_GRAD0_opsz48.svg"/>             
                <p><strong>Call us</strong></p>
                <p>
                    <abbr title="Phone">P:</abbr>
                    064 513 8232
                </p>
            </div>
        </div>
        
        <div class="col-md-4 mb-4">
            <div class="testimonial-cardd">
                <img src="Material/M1PROJECTMATERIAL/icons/mail_100dp_38B3F4_FILL1_wght400_GRAD0_opsz48.svg" />              
                <p><strong>Email us</strong></p>
                <a href="mailto:melusintshingz@gmail.com">melusintshingz@gmail.com</a>
            </div>
        </div>
    </div>
</div>    
    <div>         
           <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1732.2722928274925!2d30.976894438906662!3d-29.732948464682433!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1ef70384e313a55b%3A0x227aa182f042a15c!2s203%20Nyala%20Rd%2C%20Ezikhalini%2C%20KwaMashu%2C%204360!5e0!3m2!1sen!2sza!4v1731078016367!5m2!1sen!2sza"
                width="100%"; 
                height="500px"; 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy" 
                referrerpolicy="no-referrer-when-downgrade"></iframe>           
    </div> 
   </div>
</asp:Content>
