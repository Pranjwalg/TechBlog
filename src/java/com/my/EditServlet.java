/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.my;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author pranjwal
 */
@MultipartConfig
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})

public class EditServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
//                     fetch all data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String about = request.getParameter("about");
            Part part = request.getPart("image");
            String imgName = part.getSubmittedFileName();
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("current user");
            user.setName(name);
            user.setEmail(email);
            user.setPassword(pass);
            user.setAbout(about);
            String oldfile=user.getProfile();
            user.setProfile(imgName);
            UserDao d = new UserDao(ConnectionProvider.getConnection());
            boolean b = d.updateUser(user);
            if (b) {

                String path = request.getRealPath("/") + "profilepics" + File.separator + user.getProfile();
                      
                
            String path1 = request.getRealPath("/") + "profilepics" + File.separator + oldfile;    
                
            if(!oldfile.equals("default.png")){
                Helper.deleteFile(path1);
            }
                
                
                
                
                
                
                
                
                
                if (Helper.saveFile(part.getInputStream(), path)) {
                    Message m = new Message("Profile Updated Successfully!", "success", "alert alert-success");

                    s.setAttribute("msg", m);

                } else {
                    Message m = new Message("Something went wrong..", "error", "alert alert-warning");

                    s.setAttribute("msg", m);

                }

            } else {
                Message m = new Message("Something went wrong..", "error", "alert alert-warning");

                s.setAttribute("msg", m);

            }

            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
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
