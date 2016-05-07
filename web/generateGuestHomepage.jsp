<%-- 
    Document   : body
    Created on : Apr 18, 2016, 10:32:17 PM
    Author     : yixxie
    (Test only) Page that dynamically generate book image, description (not complete, make changes accoreding to Item class and database)
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="book" class="Items.ItemManager" scope="application" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <h2 class="text-center">Most popular</h2>
            <div class="row text-center">   
                <c:forEach items="${book.mostPopular}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2">${item.title}</font>
                                <p><a href="./guestBookPage.jsp" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Borrow</a> </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <h2 class="text-center">New eBooks</h2>
            <div class="row text-center">   
                <c:forEach items="${book.newEBooks}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                 <font size="2">${item.title}</font>
                                <p><a href="./guestBookPage.jsp" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Borrow</a> </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <!-- Recommendations for guests are books that have most totalCopies -->
             <h2 class="text-center">Recommendations</h2>
            <div class="row text-center">   
                <c:forEach items="${book.recommendations}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                 <font size="2">${item.title}</font>
                                <p><a href="./guestBookPage.jsp" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Borrow</a> </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
        </div>
        
        
    </body>
</html>
