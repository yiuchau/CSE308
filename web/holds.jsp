<%-- 
    Document   : holds
    Created on : May 7, 2016, 5:35:08 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="memberHeader.jsp" />
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Holds</title>
            <!-- Bootstrap -->
            <link rel="stylesheet" href="css/bootstrap.css">
        </head>
        <body> 
            <div class="container">
                <h2 class="text-center">Holds</h2>
                
                <h3 align="center" style="color:#008000;">${successMessage}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                
                
                <div class="row text-center">   
                    <c:forEach items="${itemManager.getCollection('Holds')}" var="item">
                        <div class="col-sm-3">
                            <div class="caption">
                                <div class="thumbnail "> <img src="${item.imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                                    <font size="2">${item.title}</font>
                                    <br>
                                    <font size="2">${item.author}</font>
                                    <br>
                                    <font size="2">${item.ISBN}</font>
                                    <a href="#" class="btn btn-primary btn-block" data-toggle="modal" data-target="#placeHold" role="button"><span  aria-hidden="true" ></span>Edit Hold</a>
                                    <p>
                                        <div class="modal fade" id="placeHold" role="dialog">
                                            <div class="modal-dialog">
                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <h2 class="modal-title">Edit Hold</h2>
            
                                                        <form role="form" action="./EditHoldServlet?isbn=${item.ISBN}" method="POST">
                                                            <div class="options" >
                                                              
                                                                
                                                                <h3>Email Address<h3>
                                                                <input type="text" class="form-control" placeholder="${itemManager.getUser().getEmail()}" name="SearchParameter" id="SearchParameter">
                                                                <br>
                                                                <input type="text" class="form-control" placeholder="suspend hold days (7 -90 days)" name="SearchParameter2" id="SearchParameter">
                                                                <br>
                                                                <h4 class="modal-title">Please set the checkout type when this book becomes available</h4>
                                                                <input type="radio" name="option" value="email" checked>Email Notification <br>
                                                                <input type="radio" name="option" value="automatic">Automatic Checkout<br>
                                                                <br>
                                                                <h4 class="modal-title">Remove Hold</h4>
                                                                <input type="radio" name="option2" value="remove" checked>Remove <br>
                                                                
                                                                <input type="radio" name="option2" value="noremove">Not Remove<br>
                                                                <br>
                                                                
                                                            </div>
                                                            <button type="" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Submit</button>
                                                        </form>
                                     
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    <p>     
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />

