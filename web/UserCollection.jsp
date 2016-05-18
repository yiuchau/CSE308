<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Items.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
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
        <title>Search Results</title>
    </head>
    <body>
        <%
            String collection = request.getParameter("collection");
            if (collection == null) {
                collection = "Checkouts";
            }

            request.setAttribute("collection", collection);
            String sort = request.getParameter("sort");

            List<Item> rs = itemManager.getUserCollection(collection, sort);
            request.setAttribute("display", rs);

        %>
        <div class="col-md-3">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h4 class="text-center">${itemManager.user.userName}</h4>
                </div>
                <div class="btn-group-vertical btn-group">
                    <a href="./UserCollection.jsp?" class="btn btn-primary">Checkouts</a>
                    <a href="./UserCollection.jsp?collection=Holds" class="btn btn-primary">Holds</a>
                    <a href="./UserCollection.jsp?collection=WishList" class="btn btn-primary">WishList (All)</a>
                    <a href="./UserCollection.jsp?collection=WishListA" class="btn btn-primary">WishList (Available)</a>
                    <a href="./UserCollection.jsp?collection=Rated" class="btn btn-primary">Rated</a>
                    <a href="./UserCollection.jsp?collection=Recommended" class="btn btn-primary">Recommended</a>
                    <a href="./accountPage.jsp" class="btn btn-primary">Settings</a>
                </div>
                <div class="panel-body">
                    <form action="./UserCollection.jsp" method="post">
                        <input type="hidden" name="collection" value='${collection}'>
                        <label for="sort">Sort by:</label>
                        <select class="form-control" name="sort">
                            <option value="title">Title</option>
                            <option value="author">Author</option>
                            <option value="averageRating">Average Rating</option>
                            <option value="releaseDate">Release Date</option>
                        </select>
                        <br>

                        <input type="submit" class="btn btn-info"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="text-center"> <%=collection%> </h4>
                </div>
                <h4 class="text-center">${display.size()} items.</h4>
                <div class="panel-body">
                    <c:forEach items="${display}" var="item" varStatus="myIndex">
                        <div class="row">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h5 class="text-center">${myIndex.index + 1} - ${item.title}</h5>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-3">
                                        <div class="thumbnail ">
                                            <a href="./bookPage.jsp?isbn=${item.ISBN}"><img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <ul class="list-group">
                                            <li class="list-group-item">ISBN: ${item.ISBN}</li>
                                            <li class="list-group-item">Author: ${item.author}</li>
                                            <li class="list-group-item">Rating: ${itemManager.getAverageRating(item.getISBN())}</li>
                                            <li class="list-group-item">Available: ${item.availableCopies}</li>
                                        </ul>
                                        <c:choose>
                                            <c:when test="${collection == 'WishList'}">
                                                <p><a href="./bookServlet?isbn=${item.ISBN}&type=removeFromWishList" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Remove</a></p>
                                            </c:when>
                                            <c:when test="${collection == 'WishListA'}">
                                                
                                                <div class="btn-group">
                                                <a href="./bookServlet?isbn=${item.ISBN}&type=removeFromWishList" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Remove</a>
                                                <a href="./bookServlet?isbn=${item.ISBN}&type=borrow" class="btn btn-primary" role="button">Borrow</a>
                                                </div>
                                            </c:when>
                                            <c:when test="${collection == 'Rated'}">
                                                <font size="2">Your Rating : ${itemManager.getRating(item.getISBN())}</font>
                                            </c:when>
                                            <c:when test="${collection == 'Recommended'}">
                                            </c:when>
                                            <c:when test="${collection == 'Holds'}">
                                                <p><a href="./EditHoldServlet?type=showEditPage&isbn=${item.ISBN}" class="btn btn-primary" role="button"><span class="glyphicon glyphicon glyphicon-edit" aria-hidden="true"></span> Edit</a></p>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="btn-group">
                                                <a href="#" class="btn btn-primary" role="button"> Download</a>
                                                <a href="#" class="btn btn-primary" role="button"> Return</a>
                                                </div>
                                            </c:otherwise>              
                                        </c:choose>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
