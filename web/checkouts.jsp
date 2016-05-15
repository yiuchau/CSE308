<%-- 
    Document   : myCollection
    Created on : Apr 21, 2016, 1:00:41 AM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Items.ItemManager"%>
<!DOCTYPE html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="memberHeader.jsp" />

    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Bootstrap eCommerce Template</title>
            <!-- Bootstrap -->
            <link rel="stylesheet" href="css/bootstrap.css">
        </head>
        <body>           
            <div class="container">
                <h2 class="text-center">Checkouts</h2>
                <a> </a>
                <div class="row text-center">   
               

                   
                <form role="form" action="./testServlet" method="POST">  
                <div class="options" >
                <br>
                <!-- 
                
                
                  // ItemManager itemManager=ItemManager.getInstance();
                  // request.getSession().setAttribute("list",itemManager.getCollection("Checkouts"));
                -->

                <input type="radio" name="option" value="a" checked>Title <br>
                
                <input type="radio" name="option" value="b">Author<br>
                
                <input type="radio" name="option" value="c">Release Date<br>
                
                <input type="radio" name="option" value="d">Added to Site<br>
                
                <input type="radio" name="option" value="e"> Most popular<br>
                
                </div>
                                
                                
                <button type="submit"><span></span>Sort By</button>
                </form> 
                    
                </div>
                    
               
               
               
                <div class="row text-center">    
                    
                    <c:forEach items="${itemManager.getCollection('Checkouts')}" var="item">
                        
                        <div class="col-sm-3" >
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                    <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Download</a></p>
                                </div>
                            </div>
                        </div>
                                    
         
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

