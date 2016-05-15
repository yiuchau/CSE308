/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Items.Item;
import Items.ItemManager;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 *
 * @author yixxie
 */
public class adminServlet extends HttpServlet {

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
            String type=request.getParameter("type");
            String ISBN=request.getParameter("isbn");
            if(type.equals("ban")){
                String message=itemManager.banABook(ISBN);
                if(message.equals("success")){
                    request.setAttribute("successMessage", message);
                }
                else{
                    request.setAttribute("errorMessage", message);
                }
                request.getRequestDispatcher("./banBook.jsp").forward(request, response);
           }
           else if(type.equals("unban")){
                String message=itemManager.unbanABook(ISBN);
                if(message.equals("success")){
                    request.setAttribute("successMessage", message);
                }
                else{
                    request.setAttribute("errorMessage", message);
                }
                request.getRequestDispatcher("./unbanBook.jsp").forward(request, response);
           }
           else if (type.equals("dismissRecommendations")){
                String message=itemManager.dismiss(ISBN);
                if(message.equals("success")){
                    request.setAttribute("successMessage", message);
                }
                else{
                    request.setAttribute("errorMessage", message);
                }
                request.getRequestDispatcher("./reviewRecommendations.jsp").forward(request, response);
           }
           else if(type.contains("purchase")){
                int amount=Integer.parseInt(request.getParameter("amount"));
                String message;
                if(type.equals("purchaseRecommendation")){
                    message=itemManager.purchase(ISBN,amount,0); //0 indicates need to update status in recommened table
                    if(message.equals("success")){
                        request.setAttribute("successMessage", message);
                    }
                    else{
                        request.setAttribute("errorMessage", message);
                    }
                    request.getRequestDispatcher("./reviewRecommendations.jsp").forward(request, response);
               }
               else{
                    message=itemManager.purchase(ISBN,amount,1); //dont' need to update status in recommended table
                    if(message.equals("success")){
                        request.setAttribute("successMessage", message);
                    }
                    else{
                        request.setAttribute("errorMessage", message);
                    }
                 request.getRequestDispatcher("./buyLicense.jsp").forward(request, response);
                }
           }
           else if(type.equals("modifyInformation")){
               String fileName=request.getParameter("fileName");
                try {
                    File fXmlFile = new File(fileName);
                    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                    Document doc = dBuilder.parse(fXmlFile);
                    doc.getDocumentElement().normalize();
                    NodeList nList = doc.getElementsByTagName("book");
                    String returnMessage="";
                    for (int temp = 0; temp < nList.getLength(); temp++) {
                        Node nNode = nList.item(temp);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            Item newItem=new Item();
                            newItem.setID(Integer.parseInt(eElement.getElementsByTagName("id").item(0).getTextContent()));
                            newItem.setISBN(eElement.getElementsByTagName("isbn").item(0).getTextContent());
                            newItem.setTitle(eElement.getElementsByTagName("title").item(0).getTextContent());
                            newItem.setAuthor(eElement.getElementsByTagName("authors").item(0).getTextContent());
                            newItem.setPublisher(eElement.getElementsByTagName("publisher").item(0).getTextContent());
                            newItem.setReleaseDate(eElement.getElementsByTagName("releaseDate").item(0).getTextContent());
                            newItem.setPageCount(eElement.getElementsByTagName("pageCount").item(0).getTextContent());
                            newItem.setCategories(eElement.getElementsByTagName("categories").item(0).getTextContent());
                            newItem.setDescription(eElement.getElementsByTagName("description").item(0).getTextContent());
                            newItem.setImageURL(eElement.getElementsByTagName("imageURL").item(0).getTextContent());
                            newItem.setAverageRating(0);
                            newItem.setTotalCopies(Integer.parseInt(eElement.getElementsByTagName("totalCopies").item(0).getTextContent()));
                            newItem.setAvailableCopies(Integer.parseInt(eElement.getElementsByTagName("availableCopies").item(0).getTextContent()));
                            newItem.setType(Integer.parseInt(eElement.getElementsByTagName("type").item(0).getTextContent()));
                            newItem.setBanned(0);
                            newItem.setBorrowedTimes(0);
                            returnMessage=returnMessage+itemManager.updateInformation(newItem)+"<br>";
                        }
                    }
                    request.setAttribute("successMessage", returnMessage);
                    request.getRequestDispatcher("./modifyInformation.jsp").forward(request, response);
                } 
                catch (Exception e) {
                    request.setAttribute("errorMessage", e);
                    request.getRequestDispatcher("./modifyInformation.jsp").forward(request, response);
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
