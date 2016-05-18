<%-- 
    Document   : AdvancedSearch
    Created on : May 17, 2016, 11:42:54 AM
    Author     : yiulin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
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
        <title>Advanced Search</title>
    </head>
    <body>
        <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="text-center">Advanced Search</h4>
                </div>
                <div class="panel-body">
                        <form method="post" action="./SearchResults.jsp?SearchType=advanced" >
                
                <label>Title</label>
                <input name="title" class="form-control" autofocus>
                <br>
                <label>Author</label>
                <input name="author" class="form-control" autofocus>
                <br>
                <label>ISBN</label>
                <input name="isbn" class="form-control" type="number" autofocus>
                <br>
                <label>Publisher</label>
                <input name="publisher" class="form-control" autofocus>
                <br>
                
                        <label for="format">Select Genre:</label>
                        <select class="form-control" name="genre">
                            <option selected disabled hidden style='display: none' value=''></option>
                            <c:forEach items="${itemManager.genres}" var="genre">

                                <option value="${genre}">${genre}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="type">Select Format:</label>
                        <select class="form-control" name="type">
                            <option selected="selected" value="0">All</option>
                            <option value="0">E-Book</option>
                            <option value="1">AudioBook</option>
                            <option value="2">Movie</option>
                        </select>
                        <br>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Search</button>
            </form>
                </div>
        </div>
    </body>
</html>
