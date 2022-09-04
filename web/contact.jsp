<%-- 
    Document   : contact
    Created on : Aug 29, 2022, 2:26:22 AM
    Author     : pranjwal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactus Page</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
         
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>

.contact-form-wrapper {
  padding: 100px 0;
}

.contact-form {
  padding: 30px 40px;
  background-color: #ffffff;
  border-radius: 12px;
  max-width: 400px;
}
.primary-background{
    
    
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
}
.contact-form{
 background:#12192c;
 color: white;
 
}
.banner{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 26% 95%, 0 100%, 0 0);

}
.contact-form textarea {
  resize: none;
}

.contact-form .form-input,
.form-text-area {
  background-color: #f0f4f5;
  height: 50px;
  padding-left: 16px;
}

.contact-form .form-text-area {
  background-color: #f0f4f5;
  height: auto;
  padding-left: 16px;
}

.contact-form .form-control::placeholder {
  color: #aeb4b9;
  font-weight: 500;
  opacity: 1;
}

.contact-form .form-control:-ms-input-placeholder {
  color: #aeb4b9;
  font-weight: 500;
}

.contact-form .form-control::-ms-input-placeholder {
  color: #aeb4b9;
  font-weight: 500;
}

.contact-form .form-control:focus {
  border-color: #f33fb0;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.07), 0 0 8px #f33fb0;
}

.contact-form .title {
  text-align: center;
  font-size: 24px;
  font-weight: 500;
}

.contact-form .description {
  color: #aeb4b9;
  font-size: 14px;
  text-align: center;
}

.contact-form .submit-button-wrapper {
  text-align: center;
}

.contact-form .submit-button-wrapper input {
  border: none;
  border-radius: 4px;
  background-color: #f23292;
  color: white;
  text-transform: uppercase;
  padding: 10px 60px;
  font-weight: 500;
  letter-spacing: 2px;
}

.contact-form .submit-button-wrapper input:hover {
  background-color: #d30069;
}

    </style>
    <body>
     
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="Register.jsp"><span class="fa fa-bell-o"></span>Learn with Pranjwal <span class="sr-only">(current)</span></a>
      </li>
     
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
       <li class="nav-item">
        <a class="nav-link" href="Login.jsp"><span class="fa fa-user-circle-o"></span>Login</a>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="Register.jsp"><span class="fa fa-user-o"></span>Sign up</a>
      </li> 
        <li class="nav-item">
        <a class="nav-link" href="About.jsp"><span class="fa fa-user-o"></span>About us</a>
      </li> 
       <li class="nav-item">
        <a class="nav-link" href="contact.jsp"><span class="fa fa-user-o"></span>Contact us</a>
      </li> 
    </ul>
    
  </div>
</nav>

<div>
  <div class="banner primary-background contact-form-wrapper d-flex justify-content-center">
     
      <form action="s" id="contact" method="post" class="contact-form">
      <h5 class="title">Contact us</h5>
      <p class="description">Feel free to contact us if you need any assistance, any help or another question.
      </p>
      <div>
          <input type="text" name="name" class="form-control rounded border-white mb-3 form-input" id="name" placeholder="Name" required>
      </div>
      <div>
        <input type="email" name="email" class="form-control rounded border-white mb-3 form-input" placeholder="Email" required>
      </div>
      <div>
        <textarea id="message" name="msg" class="form-control rounded border-white mb-3 form-text-area" rows="5" cols="30" placeholder="Message" required></textarea>
      </div>
      <div class="container text-center" id="loader" style="display: none">
  <span class="fa fa-refresh fa-spin fa-2x"></span>
  <h3>Please wait...</h3>
  </div>
      <div class="submit-button-wrapper">
        <input type="submit" id="submit" value="Send">
      </div>
    </form>
  </div>
</div>
        
        
        
        
        <script>
    
    $(document).ready(function(){
        console.log("loaded..");
        $("#contact").on('submit',function(event){
            event.preventDefault();
            
            let form=new FormData(this);
            $('#submit').hide();
            $('#loader').show();
            $.ajax({
                
                
                url:'s',
                type:'POST',
                data:form,
                success: function (data, textStatus, jqXHR) {
                       console.log(data);
                        $('#submit').show();
            $('#loader').hide(); 
                        if(data.trim()==='done'){
                       
            swal("Thankyou,your response has been successfully arrrived we will response you with in 24 hours..");

                        
                        }
                        
                        
                        else{
                            swal(data);
                            if(data.trim()==='error'){
                                 swal("something went wrong please try again later..");
                            }
                        }
                    },
                
            
            
 error: function (jqXHR, textStatus, errorThrown) {
                      
                       $('#submit').show();
            $('#loader').hide();
            swal("something went wrong please try again later..");
                                 },
                    processData:false,
                   contentType:false
                    
            });
            
            
            
        });
    });
</script>
    </body>
</html>
