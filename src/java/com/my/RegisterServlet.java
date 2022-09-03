/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.my;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pranjwal
 */
@MultipartConfig
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          boolean f=true;
String check=request.getParameter("check");
if(check==null){
    out.print("please check terms and condition");
}
else{
   String name=request.getParameter("uname");
    String email=request.getParameter("email");
     String pass=request.getParameter("pass");
      String gender=(String)request.getParameter("gender");
   if(name.equals("")){
       out.print("name can not be empty");
      f=false;
   }
    
     else if(email.equals("")){
       out.print("email can not be empty");
       f=false;
   }
  
  
  else if(pass.equals("")){
       out.print("password can not be empty");
       f=false;
   }
  
  
  else if(gender==null){ 
       out.print("please select the gender");
       f=false;
   }
 
   String about=request.getParameter("about");
   
if(f==true){   
  User u=new User(name,email,pass,gender,about); 
  UserDao d=new UserDao(ConnectionProvider.getConnection());
  if(d.saveUser(u)){
      out.print("done");
  }
  else{
     
      out.println("error");
  }
  
}

}
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
