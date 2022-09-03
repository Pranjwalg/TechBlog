<%-- 
    Document   : profile
    Created on : Aug 16, 2022, 12:47:17 AM
    Author     : pranjwal
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.User"%>
<%@page errorPage="Error.jsp" %>
<%

    User u = (User) session.getAttribute("current user");
    if (u == null) {
        response.sendRedirect("Login.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>this is profile page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="like.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
        <style>
            body{
                 
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #d71678 46%, #276a9b 100%);
            }
            .primary-background{
    
    
    background-color: #cb1637;
   background-image: linear-gradient(43deg, #4158D0 0%, #89092d 46%, #FFCC70 100%);
}
.card{
 background:#12192c;
 color: white;
 
}
.modal-body{
    background:#12192c;
 color: white;
}
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                 

                  
                    

                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"><span class="fa fa-user"></span>Contact</a>
                    </li>
                     <li class="nav-item">
        <a class="nav-link" href="About.jsp"><span class="fa fa-user-o"></span>About us</a>
      </li> 
                    <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#post"><span class="fa fa-external-link"></span>Do Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profilemodel"><span class="fa fa-user-circle"></span><%=u.getName()%></a>
                    </li>   

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-o"></span>Logout</a>
                    </li>   






                </ul>

            </div>
        </nav>
                    
                    
                    
                    
                    
                    
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {

        %>
        <div class="alert alert-<%=m.getCssClass()%>" role="alert">
            <%=m.getContent()%>
        </div>
        <%

                session.removeAttribute("msg");

            }
        %> 
        <!-- main body of the profile page -->
        <main>
            <div class="container">
                
                <div class="row mt-4">
                    <div class="col-md-4">
                      <!--categories -->
     <div class="list-group">
  <a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
  All Posts
  </a>
         
 <%
 PostDao d1=new PostDao(ConnectionProvider.getConnection());
 ArrayList<Category>List=d1.getALLCategories();
 for(Category s:List){
 %>        
 <a href="#" style="background-color:#202638;color: white;font-size:15px;"onclick="getPost(<%=s.getCid()%>,this)" getPost"  class="c-link list-group-item list-group-item-action"><%=s.getName()%></a>
  <%
      }
      %>
</div>
                        
                        
                        
                        
                    </div>
                    <div class="col-md-8">
                        <!-- posts -->
                        
                      <div class="container text-center" id="loader">
                            
                            <i class="fa fa-refresh fa-4x fa-spin"></i>  
                            <h3 class="mt-2">Loading...</h3>
                    </div>
                        <div class="container " id="postcontainer">
                            
                            
                        </div> 
                        
                        
                    </div>
                </div>
            </div>
            
            
            
            
            
        </main>
        
        
        
        
        
        
 <!-- End main body of the profile page -->
        <!--profile Modal start -->
        <div class="modal fade" id="profilemodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLongTitle">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="profilepics/<%=u.getProfile()%>" class="img-fluid" style="border-radius:50% ;max-width:120px; "/>

                            <br>

                            <h5 class="modal-title mt-3" id="exampleModalLongTitle"><%=u.getName()%></h5>

                            <!--details-->
                            <div id="profile_detail"> 
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=u.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%=u.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About :</th>
                                            <td><%=u.getAbout()%></td>
                                        </tr>


                                    </tbody>
                                </table>
                            </div>







                            <!--profile Edit-->
                            <div id="profile-edit" style="display: none">
                                <h2>Please Edit Carefully</h2>
                                <form action="EditServlet" method="post" enctype="multipart/form-data" >

                                    <table class="table">
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" name="email" class="form-control" value="<%=u.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" name="name" class="form-control" value="<%=u.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" name="pass" class="form-control" value="<%=u.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea name="about" class="form-control" rows="5" cols="15"> <%=u.getAbout()%> </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile </td>
                                            <td><input type="file" name="image" class="form-control"></td>

                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-success">Save</button>

                                    </div>      
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer primary-background">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--profile model end--> 





        <!--post model start-->



        <!-- Modal -->
        <div class="modal fade" id="post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title  " id="exampleModalLabel">Provide the post details.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                        <form id="addpost" action="AddPostservlet" method="post">




                            <div class="form-group">
                                <select class="form-control" name="cid">

                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        PostDao d = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = d.getALLCategories();

                                        for (Category c : list) {

                                    %>
                                    <option value="<%=c.getCid()%>" ><%=c.getName()%></option>
                                    <%

                                        }
                                    %>


                                </select>

                            </div>
                            <div class="form-group">
                                <input type="text" name="title" class="form-control" placeholder="Enter Post Title">


                            </div>
                            <div class="form-group">
                                <textarea class="form-control" style="height: 200px"  name="content" placeholder="Enter your content" ></textarea>

                            </div>



                            <div class="form-group">
                                <textarea class="form-control" style="height: 200px"  name="code" placeholder="Enter your program (if any) " ></textarea>

                            </div>


                            <div class="form-group">
                                <label>Please select your Picture</label>
                                <input type="file" name="pic" class="form-control">

                            </div>
                                    
                                    <div class="container text-center">                
                                        <button type="submit" class="btn btn-outline-primary">Post</button>
                                    </div> 
                    

                        </form>







                    </div>
                                  
                
            </div>
            </div>
        </div>
        <!--end model-->



        <script>
            $(document).ready(function () {
                let editstatus = false;
                $('#edit').click(function () {
                    {
                        if (editstatus == false) {
                            $('#profile-edit').show();
                            $("#profile_detail").hide();
                            editstatus = true;
                            $(this).text("Back");
                        } else {
                            $('#profile-edit').hide();
                            $("#profile_detail").show();
                            editstatus = false;
                            $(this).text("Edit");
                        }
                    }
                }
                );
            });


        </script>

        <!--now add post js-->
        <script>
         
            $(document).ready(function (e) {
                //asynconous request with the help of ajax

                $("#addpost").on("submit", function (event) {
                    event.preventDefault();
                    console.log("you have click on submit..");
                    let form = new FormData(this);
              console.log(form);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostservlet",
                        type: 'POST',
                        data: form,

                   success: function (data, textStatus, jqXHR) {
                       console.log(data);
                       if(data.trim()=='done'){
                           swal("Good Job!","Post saved successfully","success");
                           
                       }
                       else{
                        swal("Error!","something went wrong Please try again","error");   
                       }
                        },
  error: function (jqXHR, textStatus, errorThrown) {
                 swal("Error!","something went wrong PLease try again later","error");
                       },

               processData:false,
               contentType:false

                    });


                });




            });


        </script>
<!--Loading post using ajax-->
             <script>
                 function getPost(catid,temp){
                      
                       $("#loader").show();
                       $("#postcontainer").hide() ;
                       
                       $(".c-link").removeClass('active');
                      
                       
                       
               $.ajax({
                   
                   url:"Load_Post.jsp",
                   data:{cid:catid},
                   success: function (data, textStatus, jqXHR) {
                       console.log(data); 
                       
                       $("#loader").hide();
                       $("#postcontainer").show();
                       $("#postcontainer").html(data);
                       $(temp).addClass('active');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        
                    }
                   
                   
                   
                   
                   
               }) ;
                
                 }
            $(document).ready(function(){
                let allpostRef=$('.c-link')[0];
              getPost(0,allpostRef);
            });
            
            </script>
    </body>
</html>
