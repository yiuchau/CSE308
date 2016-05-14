<%-- 
    Document   : bestSeller
    Created on : May 14, 2016, 5:37:02 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="adminHeader.jsp" />
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
             <link href="css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body> 
            <div class="container">
                <h1 align="center">Bestsellers List</h1>
                <div class="row text-center">  
                    <c:forEach items="${itemManager.getCollection('bestSeller')}" var="item">
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
