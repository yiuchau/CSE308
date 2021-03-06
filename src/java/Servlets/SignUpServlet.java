package Servlets;

import Users.User;
import Items.ItemManager;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SignUpServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User newUser = new User();
        newUser.setFirstName(request.getParameter("fName"));
        newUser.setLastName(request.getParameter("LName"));
        newUser.setUserName(request.getParameter("UserID"));
        newUser.setPassword(request.getParameter("password"));
        newUser.setEmail(request.getParameter("email"));
        newUser.setPhoneNumber(request.getParameter("phoneNumber"));
        newUser.setLendingPeriod("3 days");//default value
        newUser.setMaturityLevel("adult"); //defalut adult
        String role = request.getParameter("role");
        switch (role) {
            case "member":
                newUser.setRole(1);
                break;
            case "admin":
                newUser.setRole(2);
                break;
            case "publisher":
                newUser.setRole(3);
                break;
        }
        
        ItemManager itemManager = (ItemManager) request.getSession().getAttribute("itemManager");

        if (itemManager.register(newUser)) {
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Username exists or database error. Try again.\n");
            request.getRequestDispatcher("./signUp.jsp").forward(request, response);
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
