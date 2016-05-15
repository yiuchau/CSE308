package Servlets;

import Items.CheckoutList;
import Items.Holds;
import Items.ItemManager;
import Items.RateList;
import Items.RecommendedList;
import Items.WishList;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            ItemManager im = (ItemManager) request.getSession().getAttribute("itemManager");
            
            List<CheckoutList> listreturn =im.getCheckoutList(im.getUser());
            int i =0;
            //checkout
            for( i=0 ; listreturn.size()> i; i++){
                im.removeCheckOut(listreturn.get(i));
            }
            //wishlist
            i=0;
            List<WishList> listreturn2 =im.getWishList(im.getUser());
            for( i=0 ; listreturn2.size()> i; i++){
                im.removeWish(listreturn2.get(i));
            }
            //holds
            i=0;
            List<Holds> listreturn3 =im.getHolds(im.getUser());
            for( i=0 ; listreturn3.size()> i; i++){
                im.removeHolds(listreturn3.get(i));
            }
            //ratelist
            i=0;
            List<RateList> listreturn4 =im.getAllRateList(im.getUser());
            for( i=0 ; listreturn4.size()> i; i++){
                im.removeRate(listreturn4.get(i));
            }
            //recommended
            i=0;
            List<RecommendedList> listreturn5 =im.getRecomList(im.getUser());
            for( i=0 ; listreturn5.size()> i; i++){
                im.removeRe(listreturn5.get(i));
            }
                             
            im.removeUser(im.getUser().getUserName());
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
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
