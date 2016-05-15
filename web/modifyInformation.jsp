<%-- 
    Document   : modifyInformation
    Created on : May 14, 2016, 11:22:53 PM
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
                <h1 align="center">Modify Book Information</h1>
                <h2>Please upload xml update file:</h2>
                <h3 align="center" style="color:#008000;">${title}</h3>
                <h3 align="center" style="color:#008000;">${ISBN}</h3>
                <h3 align="center" style="color:#008000;">${subject}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                <form method="post" action="./adminServlet?type=modifyInformation" class="ibm-row-form" method="POST">
                     <input name="fileName" type="text" id="fileName" class="form-control" placeholder="xml file name (absolute path only) " required autofocus>
                     <div>&nbsp;</div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit<br>
                </form>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />