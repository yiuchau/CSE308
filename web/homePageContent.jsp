<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body> 
        <div class="container">
            <h2 class="text-center">Most popular</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.mostPopular}" var="item" begin="0" end="7">
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
        <div class="container">
            <h2 class="text-center">New eBooks</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.newEBooks}" var="item" begin="0" end="7">
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
        <div class="container">
             <h2 class="text-center">Recommendations</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.recommendations}" var="item" begin="0" end="7">
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
