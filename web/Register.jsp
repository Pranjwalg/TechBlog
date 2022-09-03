<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-1 {
  background: rgb(6,14,131);
  background: linear-gradient(0deg, rgba(6,14,131,1) 0%, rgba(12,25,180,1) 100%);
  border: none;
}
.btn-1:hover {
   background: rgb(0,3,255);
background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
}

.banner{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 26% 95%, 0 100%, 0 0);
}
.primary-background{
    
    
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
}
.card{
 background:#12192c;
 color: white;
 
}
</style>



</head>
<body>
<%@include file="Nav.jsp" %>
<main class="primary-background p-3 banner" style="padding-bottom:90px;">


<div class="container">


<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card">
    <div class="card-header text-center">

<span class="fa fa-user-circle fa-3x"></span>
<br>
<h3>Register Here</h3>
</div>
<div class="card-body">
<form id="regform" action="RegisterServlet" method="post">



 <div class="form-group">
    <label for="name">User Name</label>
    <input type="text" name="uname"class="form-control" id="name" placeholder="Enter name">
    
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  
  
  <div class="form-group">
    <label for="g">Select Gender</label>
    <br>
     <input type="radio"  id="g" value="Male" name="gender">Male
     <input type="radio"  id="g" value="Female" name="gender">Female
  </div>
  
  
  <div class="form-group">
  <textarea name="about" class="form-control" cols="5" rows="5" placeholder="Enter something about yourself "></textarea>
  
  </div>
  
  <div class="form-check">
    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
  <br>
  <div class="container text-center" id="loader" style="display: none">
  <span class="fa fa-refresh fa-spin fa-2x"></span>
  <h3>Please wait...</h3>
  </div>
  <button id="submit" type="submit" class="custom-btn btn-1">Sign up</button>
</form>
</div>



</div>

</div>

</div>

</div>
</main>

<script>
    
    $(document).ready(function(){
        console.log("loaded..");
        $("#regform").on('submit',function(event){
            event.preventDefault();
            
            let form=new FormData(this);
            $('#submit').hide();
            $('#loader').show();
            $.ajax({
                
                
                url:'RegisterServlet',
                type:'POST',
                data:form,
                success: function (data, textStatus, jqXHR) {
                       
                        $('#submit').show();
            $('#loader').hide(); 
                        if(data.trim()==='done'){
                       
            swal("Registered successfully.we redirecting to login page.")
.then((value) => {
 window.location="Login.jsp";
});
                        
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