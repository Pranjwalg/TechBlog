<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to TechBlog</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/footer.css">
<style>
    
@import url('https://fonts.googleapis.com/css?family=Ubuntu');

.primary-background{
    
    
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
}

h1 {
  margin: 40px auto;
  font-family: 'Ubuntu', sans-serif;
  font-size: 70px;
  font-weight: bold;
  color: #dfdfdf;
  text-align: center;
  letter-spacing: 5px;
  text-shadow: 4px 4px 0px #000, 
      -4px 0 0px #000,
      7px 4px 0 #fff;
}
@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');

.waviy {
  position: relative;
  -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
  font-size: 60px;
}
.waviy span {
 
    font-family: auto;
    position: relative;
    display: inline-block;
    color: text-transform: uppercase;
    animation: waviy 1s infinite;
    animation-delay: calc(.1s * var(--i));
}
@keyframes waviy {
  0%,40%,100% {
    transform: translateY(0)
  }
  20% {
    transform: translateY(-20px)
  }
}







p {
  font-family: "Dank Mono", ui-monospace, monospace;
  margin-top: 1ch;
  line-height: 1.35;
  max-inline-size: 100ch;
  margin: auto;
  font-size: 20px;
}


.banner{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 26% 95%, 0 100%, 0 0);
}
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
.btn-9 {
  border: none;
  transition: all 0.3s ease;
  overflow: hidden;
}
.btn-9:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
   background-color: #1fd1f9;
background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
  transition: all 0.3s ease;
}
.btn-9:hover {
  background: transparent;
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
  color: #fff;
}
.btn-9:hover:after {
  -webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}
.btn-13 {
  background-color: #89d8d3;
background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
  border: none;
  z-index: 1;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #4dccc6;
background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover {
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
}


.bounce {
  -moz-animation: bounce 1s infinite;
  -webkit-animation: bounce 1s infinite;
  animation: bounce 1s infinite;
}

@keyframes bounce {
  0%, 0%, 0%, 20%, 20% {
    transform: translateY(0);
  }
0% {
    transform: translateY(-50px);
  }
  5% {
    transform: translateY(-0px);
  }
}
</style>
</head>
<body>

  <%@include file="Nav.jsp"%>
  
  
  <div class="container-fluid p-0 m-0">
      <div class="jumbotron primary-background  banner" style="color:#160707">
  <div class="container">
      <div class="waviy">
   <span style="--i:1">W</span>
   <span style="--i:2">E</span>
   <span style="--i:3">L</span>
   <span style="--i:4">C</span>
   <span style="--i:5">O</span>
   <span style="--i:6">M</span>
   <span style="--i:7">E</span>
   <span style="--i:8">T</span>
   <span style="--i:9">O</span>
   <span style="--i:10">T</span>
   <span style="--i:11">E</span>
   <span style="--i:12">C</span>
   <span style="--i:13">H</span>
   <span style="--i:14">B</span>
   <span style="--i:15">L</span>
   <span style="--i:16">O</span>
     <span style="--i:17">G</span>
      </div>
  <p >
 Hello!Folks this is TechBlog where you can learn something in the field of Computer Science and Information Technology and if you want to add some new information in techblog so Yes.. you can add it,and you can see the blog which is posted by other users.
this is totally free...

  </p>
  <p><i class="fas fa-hand-point-down bounce " style="font-size: 30px" ></i>So let's start...</p>
  <a href="Register.jsp" style="text-decoration: none"type="button" class="custom-btn btn-9"><span class="fa fa-external-link"></span>Start !It's free</a>
  <a href="Login.jsp" style="text-decoration: none" type="button" class="custom-btn btn-9"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
  
  </div>
  </div>
  </div>
  <div>
 <footer class="section bg-footer">
        <div class="container ">
            <div class="row">
                  <div class="col-lg-4">
                    <div class="">
                        <h6 class="footer-heading text-uppercase text-white">Let's start</h6>
                        <ul class="list-unstyled footer-link mt-4">
                            <li><a href="Register.jsp" style="text-decoration: none">Sign Up </a></li>
                            <li><a href="Login.jsp" style="text-decoration: none">Login</a></li>
                           
                        </ul>
                    </div>
                </div>
              
  <%
PostDao d=new PostDao(ConnectionProvider.getConnection());

List<Post>l= d.getonly4Post();
    
for(Post p:l){
%>

                <div class="col-lg-4">
                    <div class="">
                        <h6 class="footer-heading text-uppercase text-white">This post has been posted recently..</h6>
                           <ul class="list-unstyled footer-link mt-4">
                               <p class="contact-info"><%=p.getPtitle()%></p>
                               <h3 class="contact-info">Posted Date: <p class="contact-info"><%=p.getPdate()%></p></h3>
                    </div>
                </div>
                    <%}%>

              

                <div class="col-lg-4 ">
                    <div class="">
                        <h6 class="footer-heading text-uppercase text-white">Contact Us</h6>
                        <p class="contact-info mt-4">Contact us if need help withanything...</p>
                       
                        <p  class="contact-info"><i class="fa fa-phone " ></i>+91 9506363959</p>
                        <p class="contact-info"> <i class="fa fa-envelope"></i><a href="https://mail.google.com/mail/u/0/?tab=rm#inbox?compose=new" style="text-decoration: none;color: #acacac;">pranjwalgupta95063@gmail.com</a></p>
                        <div class="mt-3">
                            <ul class="list-inline">
                                
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/pranjwal-8bb250204/"><i class="fab google footer-social-icon fa-linkedin"></i></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/Pranjwalg"><i class="fab apple footer-social-icon fa-github"></i></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="text-center mt-5">
            <p class="footer-alt mb-0 f-14">2022 © Pranjwal, All Rights Reserved</p>
        </div>
    </footer>
  </div>
</body>



</html>