/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Items.ItemManager;
import Users.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zhaoy
 */
public class ManagerAccountServlet extends HttpServlet {

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
           ItemManager itemManager = (ItemManager)request.getSession().getAttribute("itemManager");
            String account = request.getParameter("account");
            User updatedUser = itemManager.findUser(account);
            
            String newFName = request.getParameter("customerFName");
            String newLName = request.getParameter("customerLName");
            String newEmail = request.getParameter("customerEmail");
            String newPassword = request.getParameter("customerPassword");
            String newPhoneNumber = request.getParameter("customerphoneNumber");
            String newLendingPeriod=request.getParameter("lendingPreiod");
            String newMaturityLevel=request.getParameter("maturityLevel");
            if ("None".equals(newLendingPeriod)){
                newLendingPeriod=updatedUser.getLendingPeriod(); //unchanged
            }
            if ("None".equals(newMaturityLevel)){
                newMaturityLevel=updatedUser.getMaturityLevel();  //unchanged
            }
            itemManager.updateUser2(updatedUser,newFName, newLName, newEmail, newPassword, newPhoneNumber,newLendingPeriod,newMaturityLevel);
            itemManager.updateDueTime(account);
            
            request.getRequestDispatcher("/editUser.jsp").forward(request, response);
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
