

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="memberHeader.jsp" />
    <html lang="en">
 
    
    
        <head>
            <link rel="stylesheet" href="css/bootstrap.css">
        </head>
        <body> 
            <div class="container">
                
                <h1 class="text-center">My Wishlist</h1>
                <ul class="nav navbar-nav navbar-right hidden-sm">
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Option<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="./wishlistA.jsp">Currently Available Books</a> </li>
                                <li><a href="./wishlistB.jsp">All Books</a> </li>
                            </ul>
                        </li>
                </ul>
                
                <br>
                <h2 class="text-center">Currently Available Books</h2>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('WishListA')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                    <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Remove</a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                

            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

