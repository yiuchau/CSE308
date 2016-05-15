
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
        <%!
            public void appendFilter(StringBuilder sb, String column, String value) {
                if (value != null && !value.trim().equalsIgnoreCase("")) {
                    sb.append(" AND i." + column + "='" + value + "'");
                }
            }
                    %>
        <%

            List<Item> rs = new ArrayList<Item>();
            String SearchType = request.getParameter("SearchType");

            String mainQuery;

            StringBuilder sb = new StringBuilder();

            if (SearchType != null) {
                
                sb.append("SELECT i FROM Item i WHERE 1=1");
                
                if (SearchType.equals("basic")) {
                    //rs = itemManager.basicSearch(request.getParameter("SearchParameter"));

                    String searchParameter = request.getParameter("SearchParameter");
                    searchParameter = '%' + searchParameter + '%';

                    sb.append(" AND (i.title LIKE '" + searchParameter + "' OR i.author LIKE '" + searchParameter + "')");
                    session.setAttribute("mainQuery", sb.toString());
                } else if (SearchType.equals("advanced")) {
                    //construct advanced query Title, ISBN, Author, Genre, Format, Publisher
                    String title = request.getParameter("title");
                    String author = request.getParameter("author");
                    String isbn = request.getParameter("isbn");
                    //String [] genre = request.getParameter("genre");
                    String format = request.getParameter("format");
                    String publisher = request.getParameter("publisher");

                    appendFilter(sb, "title", title);
                    appendFilter(sb, "author", author);
                    appendFilter(sb, "type", format);
                    //genre filter
                    appendFilter(sb, "publisher", publisher);
                    appendFilter(sb, "isbn", isbn);

                    session.setAttribute("mainQuery", sb.toString());

                }
            } else {
                //return most recent query
                mainQuery = (String) session.getAttribute("mainQuery");
                sb.append(mainQuery);
            }

            System.out.println("Main Query: " + request.getAttribute("mainQuery"));
            
            String availability;
            
            if (request.getParameter("availability") != null) {

                availability = request.getParameter("availability");
                
                if (availability.equals("Available")) {
                    /*for (Item i : rs) {
                        if (i.getAvailableCopies() == 0) {
                            rs.remove(i);
                        }
                    }*/

                    appendFilter(sb, "banned", "0");
                    sb.append(" AND i.availableCopies > '0'");

                } else if (request.getParameter("availability").equals("Recommendable")) {
                    /*for (Item i : rs) {
                        if (i.getTotalCopies() != 0) {
                            rs.remove(i);
                        }
                    }*/
                    appendFilter(sb, "totalCopies", "0");
                }
            } else 
                availability = "All Titles";
            
            request.setAttribute("availability", availability);

            String minRating = request.getParameter("minRating");
            if (minRating != null && !minRating.trim().equalsIgnoreCase("")) {
                sb.append(" AND i.averageRating >='" + minRating + "'");
            }

            System.out.println("Min Rating: " + minRating);

            String format2 = request.getParameter("format");
            appendFilter(sb, "type", format2);

            System.out.println("Format Filter: " + format2);

            String sort = request.getParameter("sort");
            if (sort != null && !sort.trim().equalsIgnoreCase("") && !sort.equals("relevance")) {
                sb.append(" ORDER BY i." + sort + "");
            }

            System.out.println("Sort: " + sort);

            System.out.println("Final Query: " + sb.toString());
            rs = itemManager.search(sb.toString());

            //System.out.println("Availability is " + request.getAttribute("availability"));
            request.setAttribute("display", rs);
        %>
        <div class="col-md-3">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h4 class="text-center">Filters</h4>
                </div>
                <div class="panel-body">
                    <form action="./SearchResults.jsp" method="post">
                        <label for="availability">Select Availablity:</label>
                        <select class="form-control" name="availability">
                            <option selected="selected" value="All Titles">All Titles</option>
                            <option value="Available">Available</option>
                            <option value="Recommendable">Recommendable</option>
                        </select>
                        <br>
                        <label for="displayStyle">Select Display:</label>
                        <select class="form-control" name="displayStyle">
                            <option selected="selected" value="list">List</option>
                            <option value="grid">Grid</option>
                        </select>
                        <br>
                        <label for="format">Select Format:</label>
                        <select class="form-control" name="format">
                            <option selected="selected" value="0">All</option>
                            <option value="0">E-Book</option>
                            <option value="1">AudioBook</option>
                            <option value="2">Movie</option>
                        </select>
                        <br>
                        <label for="minRating">Select Min. Rating:</label>
                        <select class="form-control" name="minRating">
                            <option selected="selected" value="0">All</option>
                            <option value="1">1+</option>
                            <option value="2">2+</option>
                            <option value="3">3+</option>
                            <option value="4">4+</option>
                        </select>
                        <br>

                        <label for="sort">Sort by:</label>
                        <select class="form-control" name="sort">
                            <option selected="selected" value="relevance">Relevance</option>
                            <option value="title">Title</option>
                            <option value="author">Author</option>
                            <option value="averageRating">Average Rating</option>
                            <option value="releaseDate">Release Date</option>
                        </select>
                        <input type="submit"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4 class="text-center"> ${availability} </h4>
                </div>
                <h4 class="text-center">${display.size()} results found.</h4>
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
        </div>
    </body>
</html>
