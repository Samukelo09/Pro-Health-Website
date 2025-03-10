<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="prohealth.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div> &nbsp</div>
    <div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1108.0928879111939!2d30.97710404382006!3d-29.733284315715437!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1ef70384e313a55b%3A0x227aa182f042a15c!2s203%20Nyala%20Rd%2C%20Ezikhalini%2C%20KwaMashu%2C%204360!5e1!3m2!1sen!2sza!4v1726140153950!5m2!1sen!2sza" 
                width="100%" 
                height="100%" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy" 
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    </div>
      <div>&nbsp</div>
    <div class="col-sm-8">
      <h3>Find us @</h3>
    <address>
        Nyala Mall<br />
        201 Nyala Road, KwaMashu L, 4359<br />
        <abbr title="Phone">P:</abbr>
        064 513 8232
    </address>

    <address>
        <strong>For Support:</strong><a href="mailto:melusintshingz@gmail.com">melusintshingz@gmail.com</a><br />      
    </address>
    </div>
  </div>
</div>
    <div>
        
    
  <section class="team-section">
    <h2>Opening Hours</h2>
      <p>Monday - 08:00 - 17:00</p>
      <p>Monday - 08:00 - 17:00</p>
      <p>Monday - 08:00 - 17:00</p>
      <p>Monday - 08:00 - 17:00</p>
    
</section>
    
    <div>&nbsp</div>
       


    <div class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Nyala Medical Center</p>
      <p><span class="glyphicon glyphicon-phone"></span>064 513 8232</p>
      <p><span class="glyphicon glyphicon-envelope"></span> <a>melusintshingz@gmail.com</a></p>
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>
    </div>
</asp:Content>
