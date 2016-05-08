package Servlets;

import Items.ItemManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ItemManager itemManager = (ItemManager)request.getSession().getAttribute("userManager");
        String retValue= itemManager.login(request.getParameter("inputUserName"), request.getParameter("inputPassword"));
        
        if(retValue.equals("Success")){
            switch (itemManager.getUser().getRole()) {
                case 1:
                    request.getRequestDispatcher("./homePageMember.jsp").forward(request, response);
                    break;
                case 2:
                    request.getRequestDispatcher("/adminHomepage.jsp").forward(request, response);
                    break;
                case 3:
                    request.getRequestDispatcher("/PublisherHomepage.jsp").forward(request, response);
                    break;
                }
        }
        else{
            request.setAttribute("errorMessage", retValue);
            request.getRequestDispatcher("./signIn.jsp").forward(request, response);
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
