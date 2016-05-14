<%-- 
    Document   : unbanBook
    Created on : May 14, 2016, 1:16:21 AM
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
                <h1 align="center">Unban a book</h1>
                <h3 align="center" style="color:#008000;">${successMessage}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('BannedBooks')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                    <p><a href="./adminServlet?type=unban&isbn=${item.ISBN}" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Unban</a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
               
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />
