

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
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
                <h1 class="text-center">Account Summary</h1>
                <br>
                
                <ul class="nav navbar-nav navbar-right hidden-sm">
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Option<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="./wishlist.jsp" >My WishList</a> </li>
                                <li><a href="./checkouts.jsp" onclick="All()">Checkouts</a> </li>
                                <li><a href="./holds.jsp" onclick="All()">Holds</a> </li>
                                <li><a href="./ratelist.jsp" onclick="All()">Rated Books</a> </li>
                            </ul>
                        </li>
                </ul>  
                
                
                <h2 class="text-center">Checkouts</h2>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('Checkouts')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
               

            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

