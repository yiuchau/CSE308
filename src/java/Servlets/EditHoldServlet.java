/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Items.Holds;
import Items.ItemManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zhaoy
 */
public class EditHoldServlet extends HttpServlet {

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
           String ISBN=request.getParameter("isbn");
           String email = request.getParameter("SearchParameter");           
           String type=request.getParameter("option");
           String days=request.getParameter("SearchParameter2");
           String ifremove =request.getParameter("option2");
           
           int i =0;
           List<Holds> list1 = itemManager.getHolds(itemManager.getUser());
           Holds change = new Holds();
           String message="";
           for(i=0;i<list1.size();i++){
                if(ISBN.equals(list1.get(i).getIsbn())){
                    change = list1.get(i);
                }
            }
           
           if(ifremove.equals("remove")){
               
               itemManager.removeHolds(change);
               request.setAttribute("successMessage", "Remove hold");
               
           }else{
               

               itemManager.updateHold(email,change,type,days);
               request.setAttribute("successMessage", "Updated holds");
           }
                     
            
          request.getRequestDispatcher("./holds.jsp").forward(request, response);
            
            
            
            
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
