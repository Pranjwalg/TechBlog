<%-- 
    Document   : show_blog_page
    Created on : Aug 23, 2022, 4:17:43 PM
    Author     : pranjwal
--%>
<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.entities.User"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="Error.jsp"%>

<%

    User u = (User) session.getAttribute("current user");
    if (u == null) {
        response.sendRedirect("Login.jsp");
    }

%>
<%
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d1=new PostDao(ConnectionProvider.getConnection());
        Post p= d1.getPostById(postId);
        User u1=d1.getUserByPost(p.getUserid());

%>
<%
    LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
    
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getPtitle()%>||TechBlog by learn Code with Pranjwal</title>
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/tech.css" type="text/css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="like.js"></script>
    
    <style>
  .primary-background{
    
    
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
}
body{
     
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
}
.card{
 background:#12192c;
 color: white;
 
}
        body{
           background:url(images/images.jpeg);
           background-size: cover;
           background-attachment: fixed;
            
        }
        .p_title{
            font-weight: 100;
            font-family: serif;
            font-size: 40px;
            
        }
        .p_content{
            font-weight: 100;
            font-family: serif;
            font-size: 20px;
        }
        .p_code{
           font-weight: 100;
            font-family: serif;
            font-size: 20px; 
        }
        .name{
            font-size: 20px;
            
        }
        .date{
            font-style: italic;
           font-weight: bold;
           
        }
        .n{
            border: 1px solid black;
            
        }
    </style>  
    </style>
    </head>
    
    <body>
        <!--nav start-->
           <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>Learn with Pranjwal <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-circle-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-user"></span>Contact</a>
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
      <!--nav end-->
      
        <!--main content-->
     <div class="container">
         
         
         
         <div class="row my-4">
             <div class="col-md-8 offset-md-2">
                 
                 <div class="card-header primary-background text-white">
                     <h4 class="p_title"><%=p.getPtitle()%></h4>
                     
                     
                 </div>
                     <div class="card-body">
                          <img class="card-img-top" src="Blog_pics/<%=p.getPpic()%>" alt="Card image cap">
                             
                          <div class="row my-4 n">
                              <div class="col-md-8">
                                  <p  class="name"><a href="#"><%=u1.getName()%> </a>has Posted: </p>
                              </div> 
                              <div class="col-md-4">
                                  <p class="date"><%=p.getPdate().toLocaleString()%></p>
                                  
                              </div>
                              
                          </div>  
                          
                          
                       
                          <p class="p_content"><%=p.getPcontent()%></p>
                         
                         <br>
                         <br>
                         <div class="p_code">
                         <pre><%=p.getPcode()%></pre>
                         </div>
                     </div>
                     <div class="card-footer primary-background text-white">
                         <a href="#" onclick="doLike(<%=p.getPid()%>,<%=u.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like_counter<%=p.getPid()%>"><%=ld.countLike(p.getPid())%></span></a>
      

         <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                     </div>
                 
             </div>
             
         </div>
     </div>
        
        
     
     <!--end main content-->
        
      
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
                    <div class="modal-footer">
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
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details.</h5>
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

   
    </body>
</html>
