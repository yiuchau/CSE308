<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Items.ItemManager"%>
<%@page import="Items.Item"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<html>
    <head>
        <c:choose>
            <c:when test="${itemManager.user==null}">
                <jsp:include page="guestHeader.jsp" />
            </c:when>    
            <c:otherwise>
                <jsp:include page="memberHeader.jsp" />
            </c:otherwise>
        </c:choose>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="js/bookPage.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h3 align="center" style="color:#008000;">${successMessage}</h3>
        <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
        <div id="fb-root"></div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>

        <script>
            !function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                if (!d.getElementById(id)) {
                    js = d.createElement(s);
                    js.id = id;
                    js.src = p + '://platform.twitter.com/widgets.js';
                    fjs.parentNode.insertBefore(js, fjs);
                }
            }(document, 'script', 'twitter-wjs');</script>

        <script
            type="text/javascript"
            async defer
            src="//assets.pinterest.com/js/pinit.js"
        ></script>

        <%
            System.out.println(request.getParameter("isbn"));
            Item item = ItemManager.getInstance().findItem(request.getParameter("isbn"));
        %>

        <div class="container-fluid">
            <div class="row-fluid">


                <div class="col-sm-4 col-sm-offset-1">
                    <div class="thumbnail" style="border:none;"> 

                        <div class="thumbnail"> <a href="#"><img src="<%= (item.getImageURL())%>" width="250" height="150" class="img-responsive"></a>

                        </div>
                       
                             
                        <% if(item.getTotalCopies()==0){ %>
                            <div class="caption">
                                <a href="#" class="btn btn-primary btn-block" role="button"
                                onclick=""><span  aria-hidden="true" ></span>Recommend</a>
                        <% } else { %>
                            <% if(item.getAvailableCopies()!=0){ %>
                                <div class="caption">
                                    <a href="./bookServlet?isbn=<%= (item.getISBN())%>&type=borrow" class="btn btn-primary btn-block" role="button"
                                       ><span  aria-hidden="true" ></span>Borrow</a>
                            <% } else { %>
                                <div class="caption">
                                    <a href="./bookServlet?isbn=<%= (item.getISBN())%>&type=placeHold" class="btn btn-primary btn-block" role="button"
                                            onclick=""><span  aria-hidden="true" ></span>Place Hold</a>
                            <% } %>       
                        <% } %>

                            <a href="./bookServlet?isbn=<%= (item.getISBN())%>&type=addToWishList" class="btn btn-info btn-block" role="button"
                               ><span class="text-center" aria-hidden="true" ></span>Wishlist</a>
                            
                            <a href="#" class="btn btn-warning btn-block" data-toggle="modal" data-target="#bookSample" role="button"><span aria-hidden="true" ></span>Sample</a>
                                <div class="modal fade" id="bookSample" role="dialog">
                                <div class="modal-dialog modal-lg">

                                        <h1>Book Sample</h1>

                                <!-- Modal content-->
                                <div class="modal-content">
                                    
                                <div class="modal-body">
                                    <iframe src="./bookServlet?isbn=<%= (item.getISBN())%>&type=viewSample" width="700" height="580"></iframe>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                                </div>
      
                                </div>
                                </div>
                            
                            <p>
                            <div class="ratingStars text-center">
                                <image id="ratingStar" value = "1" src="images/emptyStar.png" width="25" height=25"> </image>
                                <image id="ratingStar" value = "2" src="images/emptyStar.png" width="25" height=25"> </image>
                                <image id="ratingStar" value = "3" src="images/emptyStar.png" width="25" height=25"> </image>
                                <image id="ratingStar" value = "4" src="images/emptyStar.png" width="25" height=25"> </image>
                                <image id="ratingStar" value = "5" src="images/emptyStar.png" width="25" height=25"> </image>
                                </p>
                                <a class="editRating btn btn-danger btn-block" role="button"><span  aria-hidden="true" ></span>Edit Rating</a>
                                <a class="editRating btn btn-default btn-block" role="button"><span  aria-hidden="true" ></span>Remove Rating</a>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h2 class="panel-title text-center"><%= (item.getTitle())%></h2>
                        </div>
                        <div class="panel-body">
                            <div>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getAuthor())%></h4>
                                        <p class="list-group-item-text">Author</p></li>

                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getISBN())%></h4>
                                        <p class="list-group-item-text">ISBN</p></li>

                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getPublisher())%></h4>
                                        <p class="list-group-item-text">Publisher</p></li>

                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getReleaseDate())%></h4>
                                        <p class="list-group-item-text">Release Date</p></li>

                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getAverageRating())%></h4>
                                        <p class="list-group-item-text">Average Rating</p></li>
                                    
                                     <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getCategories())%></h4>
                                        <p class="list-group-item-text">Subjects</p></li>
                                     
                                     <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getAvailableCopies())%></h4>
                                        <p class="list-group-item-text">Available Copies</p></li>

                                    <li class="list-group-item">
                                        <h4 class="list-group-item-heading"><%= (item.getTotalCopies())%></h4>
                                        <p class="list-group-item-text">Total Copies</p></li>
                            </div>

                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" href="#collapse1">View Description</a>
                                        <span class="caret"></span></button>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <blockquote>
                                            <%= (item.getDescription())%>
                                        </blockquote></div>
                                </div>
                            </div>



                            <div class="btn-group">
                                <a class="fb-share-button" 
                                   data-href="http://localhost:8080/308code/guestBookPage.jsp" 
                                   data-layout="button_count"> </a>     
                                <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                                <a href="https://www.pinterest.com/pin/create/button/">
                                    <img src="//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png" /></a>
                                <a href="mailto:?subject=I wanted you to see this site&amp;body=Check out this site http://www.website.com."
                                   title="Share by Email">
                                    <img src="http://png-2.findicons.com/files/icons/573/must_have/48/mail.png">
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<jsp:include page="footer.jsp" />
</html>
