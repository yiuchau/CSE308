<%-- 
    Document   : generateMemberCollection
    Created on : Apr 21, 2016, 1:01:35 AM
    Author     : Brian Lee
--%>

<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<jsp:useBean id="userManager" class="Users.UserManager" scope="session" />    
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
            <h2 class="text-center">Checkouts</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCheckoutList(userManager.user)}" var="item">
                    <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${itemManager.getInformationByISBN(item.isbn).imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${itemManager.getInformationByISBN(item.isbn).title}</font>
                                </div>
                            </div>
                    </div>
                </c:forEach>
            </div>
            
           
            
           
            
        </div>
       
        
    </body>
</html>
