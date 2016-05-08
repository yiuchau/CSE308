<%-- 
    Document   : homePageMember
    Created on : Apr 18, 2016, 9:37:10 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <jsp:include page="memberHeader.jsp" />
    <jsp:include page="Ads.jsp" />
    <head>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body> 
        <div class="container">
            <h2 class="text-center">Most Popular</h2>
            <div class="row text-center">   
                <c:forEach items = "${itemManager.getCollection('MostPopular')}" var = "item" begin = "0" end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2" maxlength="30">${item.title}</font>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <h2 class="text-center">Most Recent</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCollection('MostRecent')}" var="item" begin="0"  end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2" maxlength="30">${item.title}</font>
                               
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <h2 class="text-center">Recommendations</h2>
            <div class="row text-center">   
                <c:forEach items="${itemManager.getCollection('Recommended')}" var="item" begin="0"  end="7">
                    <div class="col-sm-3">
                        <div class="thumbnail "> <a href="./guestBookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <div class="caption">
                                <font size="2" maxlength="30">${item.title}</font>
                               
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>


    </body>
</html>

<jsp:include page="footer.jsp" />

</html>
