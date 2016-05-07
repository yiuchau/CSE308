<%-- 
    Document   : generateMemberHomepage
    Created on : Apr 21, 2016, 12:36:43 PM
    Author     : Brian Lee
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
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
            <div class="row text-center">   
                <c:forEach items="${itemManager.itemCollection}" var="item">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./memberBookPage.jsp"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2">${item.title}</font>
                                <p><a href="./memberBookPage.jsp" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Borrow</a> </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
                
        </div>
    </body>
</html>
