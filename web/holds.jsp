<%-- 
    Document   : holds
    Created on : May 7, 2016, 5:35:08 PM
    Author     : yixxie
--%>

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
            <title>Holds</title>
            <!-- Bootstrap -->
            <link rel="stylesheet" href="css/bootstrap.css">
        </head>
        <body> 
            <div class="container">
                <h2 class="text-center">Holds</h2>
                
                <h3 align="center" style="color:#008000;">${successMessage}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                
                
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('Holds')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                    <br>
                                    <p><a href="./EditHoldServlet?type=showEditPage&isbn=${item.ISBN}" class="btn btn-primary" role="button"><span class="glyphicon glyphicon glyphicon-edit" aria-hidden="true"></span>Edit holds</a></p>
                                
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

