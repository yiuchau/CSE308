
<<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
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
            <h2 class="text-center">Most popular</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCollection('MostPopular')}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./bookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2">${item.title}</font>
                              
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <h2 class="text-center">New Release</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCollection('MostRecent')}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./bookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                 <font size="2">${item.title}</font>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <!-- Recommendations for guests are books that have most totalCopies -->
             <h2 class="text-center">Recommendations</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCollection('Recommendations')}" var="item" begin="0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./bookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                 <font size="2">${item.title}</font>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>     
        </div>
    </body>
</html>
