/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Items.ItemManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yixxie
 */
public class bookServlet extends HttpServlet {

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
        ItemManager itemManager = (ItemManager)request.getSession().getAttribute("itemManager");
        String ISBN=request.getParameter("isbn");
        request.setAttribute("isbn", ISBN);
        String type=request.getParameter("type");
        String option="";
        if(type.equals("viewSample")){
            request.getRequestDispatcher("./bookSample.jsp").forward(request, response);
        }
        else {
            if(itemManager.getUser()==null){
                request.getRequestDispatcher("./signIn.jsp").forward(request, response);
            }
            else{
                switch (type) {
                    case "borrow":
                        if(itemManager.addToCheckoutList(ISBN)==true){
                            request.setAttribute("successMessage", "Added to checkout list");
                        }
                        else{
                            request.setAttribute("errorMessage", "You've already borrowed this book!");
                        }   break;
                    case "addToWishList":
                        if(itemManager.addToWishList(ISBN)==true){
                            request.setAttribute("successMessage", "Added to wishlist");
                        }
                        else{
                            request.setAttribute("errorMessage", "This book is already in your wishlist!");
                        }   break;
                    case "removeFromWishList":
                        itemManager.removeFromWishList(ISBN);
                        request.setAttribute("successMessage", "Removed from wishlist");
                        break;   
                    case "placeHold":
                        option=request.getParameter("option");
                        String message=itemManager.addToHoldsList(ISBN,option);
                        if("success".equals(message)){
                            request.setAttribute("successMessage", "Added to holds");
                        }
                        else{
                            request.setAttribute("errorMessage", message);
                        } 
                        break;
                    case "recommend":
                        option=request.getParameter("option");
                        String email=request.getParameter("email");
                        if(itemManager.addToRecommended(ISBN,option,email)){
                            request.setAttribute("successMessage", "Added to recommended books");
                        }
                        else{
                            request.setAttribute("errorMessage", "You've already recommended this book!");
                        }
                        break;
                    default:
                        break;
                }
                request.getRequestDispatcher("./bookPage.jsp?isbn="+ISBN).forward(request, response);
                
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
