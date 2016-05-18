
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genres</title>
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <c:choose>
            <c:when test="${itemManager.user == null}">
                <jsp:include page="guestHeader.jsp" />
            </c:when>    
            <c:otherwise>
                <jsp:include page="memberHeader.jsp" />
            </c:otherwise>
        </c:choose>
    </head>
    <body>
        
        
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="text-center">All Genres</h4>
                </div>
                <div class="panel-body">

        <div class="col-sm-4">
            <ul>
                <c:forEach items="${itemManager.genres}" var="item" begin="0" end='${itemManager.genres.size() / 3 + (itemManager.genres.size() % 3 == 0 ? 0 : 1) - 1}'>
                    <li><a href="./SearchResults.jsp?SearchType=advanced&genre=${item}">${item}</a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="col-sm-4">
            <ul>

                <c:forEach items="${itemManager.genres}" var="item" begin='${itemManager.genres.size() / 3 + (itemManager.genres.size() % 3 == 0 ? 0 : 1)}' end='${2 * (itemManager.genres.size() / 3 + (itemManager.genres.size() % 3 == 0 ? 0 : 1)) - 1}'>

                    <li><a href="./SearchResults.jsp?SearchType=advanced&genre=${item}">${item}</a></li>
                </c:forEach>
            </ul>
        </div>
                
                 <div class="col-sm-4">
            <ul>

                <c:forEach items="${itemManager.genres}" var="item" begin='${2 * (itemManager.genres.size() / 3 + (itemManager.genres.size() % 3 == 0 ? 0 : 1))}' end='${itemManager.genres.size() - 1}'>

                    <li><a href="./SearchResults.jsp?SearchType=advanced&genre=${item}">${item}</a></li>
                </c:forEach>
            </ul>
        </div>
                
                </div>
            </div>
    </body>
    
    
    <jsp:include page="footer.jsp" />
</html>
