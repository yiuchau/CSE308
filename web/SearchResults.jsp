
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
            List<Item> rs = new ArrayList<Item>();
            String SearchType = request.getParameter("SearchType");
            
            if (SearchType.equals("basic")) {
                rs = itemManager.basicSearch(request.getParameter("SearchParameter"));
            }
            
            if (request.getParameter("availability") != null) {
                if (request.getParameter("availability").equals("Available")) {
                    for (Item i : rs) {
                        if (i.getAvailableCopies() == 0) {
                            rs.remove(i);
                        }
                    }
                } else if (request.getParameter("availability").equals("Recommendable")) {
                    for (Item i : rs) {
                        if (i.getTotalCopies() != 0) {
                            rs.remove(i);
                        }
                    }
                }
            } else
                request.setAttribute("availability", "All Titles");
            
            System.out.println("Availability is " + request.getAttribute("availability"));

            request.setAttribute("display", rs);
        %>
        <div class="col-md-3">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h4 class="text-center">Filters</h4>
                </div>
                <div class="panel-body">
                    <label for="availability">Select Availablity:</label>
                    <select class="form-control" name="availability">
                        <option value="All Titles">All Titles</option>
                        <option value="Available">Available</option>
                        <option value="Recommendable">Recommendable</option>
                    </select>
                    <br>
                    <label for="displayStyle">Select Display:</label>
                    <select class="form-control" name="displayStyle">
                        <option value="list">List</option>
                        <option value="grid">Grid</option>
                    </select>
                    <br>
                    <label for="format">Select Format:</label>
                    <select class="form-control" name="format">
                        <option value="0">E-Book</option>
                        <option value="1">AudioBook</option>
                        <option value="2">Movie</option>
                    </select>
                    <br>
                    <label for="minRating">Select Min. Rating:</label>
                    <select class="form-control" name="minRating">
                        <option value="0">All</option>
                        <option value="1">1+</option>
                        <option value="2">2+</option>
                        <option value="3">3+</option>
                        <option value="4">4+</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="text-center">${availability} </h4>
                </div>
                <h4 class="text-center">${display.size()} results found for "${param.SearchParameter}".</h4>
                <div class="list-group">
                    <c:forEach items="${display}" var="item" begin="0" end="7">
                        <div class="row">
                            <div class="panel-body">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h5 class="text-center">${item.title}</h5>
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
                                                <li class="list-group-item">Rating: ${item.averageRating}</li>
                                                <li class="list-group-item">Copies: ${item.availableCopies}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <label for="sort">Sort by:</label>
            <select class="form-control" name="sort">
                <option value="title">Title</option>
                <option value="author">Author</option>
                <option value="author">Average Rating</option>
                <option value="popularity">Popularity</option>
                <option value="releaseDate">Release Date</option>
            </select>
        </div>
    </body>
</html>
