<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
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
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-check-circle-o"></span> Categories
        </a>
          <div class="dropdown-menu primary-background p-0 m-0" 
 aria-labelledby="navbarDropdown  ">
         <%
 PostDao d1=new PostDao(ConnectionProvider.getConnection());
 ArrayList<Category>List=d1.getonly2();
 for(Category s:List){
 %>  
 
 <a href="Login.jsp" onclick="getPost(<%=s.getCid()%>,this)" getPost" class="c-link list-group-item list-group-item-action " style="background:#12192c;
 color: white;"><%=s.getName()%></a>
  <%
      }
      %>
        </div>
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