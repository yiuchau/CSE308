<%-- 
    Document   : buyLicense
    Created on : May 14, 2016, 4:40:01 PM
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
                <h1 align="center">Buy book licenses</h1>
                <h3 align="center" style="color:#008000;">${successMessage}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                <form method="post" action="./adminServlet?type=purchaseLicenses" class="ibm-row-form" method="POST">
                    <h2>Please enter book ISBN:</h2>
                    <input name="isbn" type="text" id="isbn" class="form-control" placeholder="ISBN" required autofocus>
                    <div>&nbsp;</div>
                    <h2>Please enter the amount:</h2>
                    <input name="amount" type="text" id="amount" class="form-control" placeholder="Amount" required autofocus> 
                    <div>&nbsp;</div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit<br>
                </form>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />
