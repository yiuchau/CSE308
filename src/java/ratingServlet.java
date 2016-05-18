/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Items.ItemManager;
import Users.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brian Lee
 */
@WebServlet(urlPatterns = {"/ratingServlet"})
public class ratingServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ItemManager itemManager = (ItemManager)request.getSession().getAttribute("itemManager");
        
        User currentUser = itemManager.getUser();
        String ISBN= request.getParameter("currentBook");
        String ratingAmountString= request.getParameter("rating");
        int ratingAmount = Integer.parseInt(ratingAmountString);
        
        if (itemManager.getRating(ISBN) != 0){
        itemManager.deleteRating(ISBN);
        System.out.println("Deleted Rating");
        }
        
        itemManager.submitRating(ISBN,currentUser,ratingAmount);
        
        request.getRequestDispatcher("./bookPage.jsp?isbn="+ISBN).forward(request, response);
       
    
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