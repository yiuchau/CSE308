<%-- 
    Document   : unbanBook
    Created on : May 14, 2016, 1:16:21 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    
    <html lang="en">
        <jsp:include page="adminHeader.jsp" />
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
             <link href="css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body> 
            <div class="container">
                <h1 align="center">Edit User Information</h1>
                <h3> Please input the user account you want to edit </h3>
                <div>
                    <form class="navbar-form" action="./accountedit.jsp" role="search">
                            <div class="input-group">
                                <input type="hidden" name="SearchType" value="basic">  
                                <input type="text" class="form-control" placeholder="Account Name" name="SearchParameter" id="SearchParameter">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                    </form>
                </div>
                
                
               
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />
