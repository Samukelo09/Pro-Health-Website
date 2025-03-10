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


.team-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    padding: 40px 0;
}

.team-card {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 200px;
    padding: 20px;
    transition: transform 0.3s;
}

.team-card:hover {
    transform: translateY(-5px);
}

.team-photo {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 15px;
    object-fit: cover;
}

.team-name {
    font-size: 1.2em;
    font-weight: bold;
    color: #333;
    margin: 10px 0 5px;
}

.team-title {
    font-size: 0.9em;
    color: #38b6f4; /* Primary color */
    margin-bottom: 10px;
}

.team-description {
    font-size: 0.9em;
    color: #666;
    line-height: 1.4;
}
/* Styles for h1 header */
.header-title {
   
    font-size: 2.5em; 
    text-align: center; 
    margin: 20px 0; 
    font-weight: bold; 

    letter-spacing: 1px; 
}
.info-box {
    min-height: 200px;

}

        </style>
        

    </header>
    
    <div class="header-title">
        <h1>About Us</h1>
    </div>
    <div class="about-section info-box">
       
      <p>Welcome to Prohealth, a platform dedicated to enhancing the relationship between healthcare providers and patients. We aim to make healthcare more accessible, efficient, and personalized through our innovative solutions. Our team is committed to building a user-friendly platform that empowers patients and streamlines the workload for doctors.

At Proheath, we believe that technology can bridge gaps and make a real difference in the way healthcare services are delivered and experienced. Whether you're a patient seeking care or a doctor managing your practice, our platform is tailored to meet your unique needs.</p> 
  
</div>      
    <div style="background-color:#FEF8F5">
   <div class="about-section">   
    <div class="about-image">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/doctors-team.jpg" alt="About Us Image">
        </div>  
    <div class="about-container">
        <h2>Our Mission</h2>
        <p>Our mission is to revolutionize the healthcare experience by leveraging technology to provide seamless, transparent, and patient-centered services. We strive to create a digital space where patients can easily connect with their healthcare providers, book appointments, and access vital health information. For doctors, we aim to reduce administrative burdens and enhance the ability to provide quality care.</p>
    </div>
       </div>
  <div class="about-section">    

    <div class="about-container">
        <h2>Our Vision</h2>
        <p>We envision a future where healthcare is not only accessible but also highly efficient and personalized. Our goal is to be the leading platform that transforms how doctors and patients interact, ensuring that every individual receives the care they need, when they need it. By fostering trust, innovation, and accessibility, we aim to create healthier communities worldwide.</p>
    </div>
      <div class="about-image">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/martha-dominguez-de-gouveia-k-NnVZ-z26w-unsplash.jpg" alt="About Us Image">
        </div>
       </div>
       
<div style="background-color:#F5FBFE">
    <div class="header-title">
    <h2>Meet Our Team</h2>
        </div>
 <div class="team-section">
    <!-- Team Member 1 -->
    <div class="team-card">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/siphilele-avatar.jpg" alt="Team Member 1" class="team-photo">
        <div class="team-name">Dr Siphilele Mkhize</div>
        <div class="team-title">General Practitioner</div>
        <p class="team-description">John leads our projects with a focus on quality and timely delivery.</p>
    </div>

    <!-- Team Member 2 -->
    <div class="team-card">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/dr2.jpg" alt="Team Member 2" class="team-photo">
        <div class="team-name">Dr Zolile Mzobe</div>
        <div class="team-title">General Practitioner</div>
        <p class="team-description">Jane has extensive experience in web and mobile app development.</p>
    </div>

    <!-- Team Member 3 -->
    <div class="team-card">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/olwethu-avatar.jpg" alt="Team Member 3" class="team-photo">
        <div class="team-name">Dr Olwethu Nxasana</div>
        <div class="team-title">General Practitioner</div>
        <p class="team-description">Alex brings designs to life with a focus on user experience.</p>
    </div>

    <!-- Team Member 4 -->
    <div class="team-card">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/nkanyezi-avatar.jpg" alt="Team Member 4" class="team-photo">
        <div class="team-name">Dr Nkanyezi Ngobese</div>
        <div class="team-title">General Practitioner</div>
        <p class="team-description">Emily specializes in transforming data into actionable insights.</p>
    </div>

    <!-- Team Member 5 -->
    <div class="team-card">
        <img src="Material/M1PROJECTMATERIAL/INAPPPIC/samukelo-avatar.jpg" alt="Team Member 5" class="team-photo">
        <div class="team-name">Dr Samukelo Mkhize</div>
        <div class="team-title">General Practitionert</div>
        <p class="team-description">Michael develops strategies to connect with our target audience.</p>
    </div>
</div>
   </div>
</div>
    
  
</asp:Content>
