<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page import="com.techblog.dao.PostDao"%>

<style>
    .custom-btn {
 width: 60px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 5px;
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


.custom1-btn {
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
.btn-11 {
  border: none;
  background: rgb(251,33,117);
    background: linear-gradient(0deg, rgb(114 65 101) 0%, rgb(249 10 102) 100%);
    color: #fff;
    overflow: hidden;
}
.btn-11:hover {
    text-decoration: none;
    color: #fff;
}
.btn-11:before {
    position: absolute;
    content: '';
    display: inline-block;
    top: -180px;
    left: 0;
    width: 30px;
    height: 20%;
    background-color: #fff;
    animation: shiny-btn1 3s ease-in-out infinite;
}
.p{
     background-color:#171a16;
   background: linear-gradient(43deg, #0e0e0e 0%, #141414 46%, #3512f5 100%);
}
.btn-11:hover{
  opacity: .7;
}
.btn-11:active{
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
}


@-webkit-keyframes shiny-btn1 {
    0% { -webkit-transform: scale(0) rotate(45deg); opacity: 0; }
    80% { -webkit-transform: scale(0) rotate(45deg); opacity: 0.5; }
    81% { -webkit-transform: scale(4) rotate(45deg); opacity: 1; }
    100% { -webkit-transform: scale(50) rotate(45deg); opacity: 0; }
}
.btn-9 {
  border: none;
  transition: all 0.3s ease;
 background: blue;
  overflow: hidden;
}
.btn-9:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 30%;
  height: 10%;
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
.b{
  border: none;
  transition: all 0.3s ease;
  overflow: hidden;
 
}
.b:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 30%;
  height: 10%;
   background-color: #1fd1f9;
background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
  transition: all 0.3s ease;
}
.b:hover {
  background: transparent;
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
  color: #fff;
}
.b:hover:after {
  -webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}

/* 10 */

    
</style>
<div class="row">
    
<%
    Thread.sleep(1000);
PostDao d=new PostDao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> l=null;
if(cid==0){
l=d.getAllPosts();
    }
    else{
l=d.getPostCatId(cid);
    }
if(l.size()==0){
out.println("<h3 class='display-10 text-center'>NO Posts in this category</h3>");
return ;
    }    
    
    
for(Post p:l){
%>

<div  class="col-md-6 mt-2">
    <div class="card">
       
    <div class="card-body">
        
    <b><%=p.getPtitle()%></b>
    <p><%=p.getPcontent()%></p>
   
   <%

    User u = (User) session.getAttribute("current user");
    if (u == null) {
        response.sendRedirect("Login.jsp");
    }

%>

<%
    LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
    
  %>
    </div>
     <img class="card-img-top" src="Blog_pics/<%=p.getPpic()%>" alt="Card image cap">
    <div class="card-footer text-center p" >
        <a href="#" style="text-decoration: none" onclick="doLike(<%=p.getPid()%>,<%=u.getId()%>)" class="custom-btn b btn-6<%=p.getPid()%> btn-sm" ><i class="fa fa-thumbs-o-up"></i>
           <span class="like_counter<%=p.getPid()%>"><%=ld.countLike(p.getPid())%></span></a>
        <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="custom1-btn btn-11">ReadMore</a>

        
    </div>
    </div>
</div>







<%

    }

%>
</div>