/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Users.User;
import Users.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brian Lee
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");     
            out.println("</head>");
            out.println("<body>");
            
        //ServletContext sc = this.getServletContext();
        
        //Not sure how userManager bean works, the following code can be changed later
        UserManager userManager = (UserManager) request.getSession().getAttribute("userManager");
        /*
        User b=(User) sc.getAttribute("loggedInUser");
            if(b==null){
                b=new User() {};
                sc.setAttribute("loggedInUser",b);
            }
        b.setUserName(request.getParameter("inputUserName"));
        UserManager manager=new UserManager();
        */
        String retValue= userManager.login(request.getParameter("inputUserName"), request.getParameter("inputPassword"));
        if(retValue.equals("success")){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/homePageMember.jsp");
            dispatcher.forward(request, response);
        }
        else{
            out.println("<span style='color:red'>"+retValue+"</span>");
            //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/sign/signIn.jsp");
            //dispatcher.forward(request, response);
        }
 
        //userManager.login(request.getParameter("inputEmail"), request.getParameter("inputPassword"));
        //error check, invalid info
        //User user = userManager.getUser();
        //sc.setAttribute("loggedInUser", user);
        //send to respective 
        
        
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
