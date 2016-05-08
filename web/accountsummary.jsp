

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
                
                <br>
                <h2 class="text-center">My Wishing List</h2>
                <br>
                <br>
                <h2 class="text-center">Currently Available Books</h2>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('WishListA')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                
                <h2 class="text-center">All Books</h2>
                <div class="row text-center">  
                    
                    <c:forEach items="${itemManager.getCollection('WishList')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <br>
                <h2 class="text-center">Holds</h2>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('Holds')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <br>                         
                <h2 class="text-center">Rated Books</h2>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getRateList(itemManager.user)}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${itemManager.findItem(item.isbn).imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${itemManager.findItem(item.isbn).title}</font>
                                    <br>
                                    <font size="2">Average Rating : ${itemManager.findItem(item.isbn).averageRating}</font>
                                    <br>
                                    <font size="2">Your Rating : ${item.rate}</font>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

