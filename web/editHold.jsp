<%-- 
    Document   : editHold
    Created on : May 15, 2016, 10:04:14 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <jsp:include page="memberHeader.jsp" />
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
             <link href="css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body> 
            <div class="container">
                <h1 align="center">Edit Hold Options</h1>
                <h3 align="center" style="color:#008000;">${successMessage}</h3>
                <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                <form role="form" action="./EditHoldServlet?isbn=${ISBN}&type=others" method="POST">
                    <div class="options" >
                        <h4>Edit your email address:<h3>
                        <input type="email" class="form-control" placeholder="${itemManager.getUser().getEmail()}" name="email" id="email">
                        <br>
                        <h4>Enter your suspend days:(7 - 90 days)</h4>
                        <input type="text" class="form-control" placeholder="suspend hold days (7 -90 days)" name="days" id="days">
                        <br>
                        <h4>Please set the checkout type when this book becomes available</h4>
                        <input type="radio" name="option" value="email" checked>Email Notification <br>
                        <input type="radio" name="option" value="automatic">Automatic Checkout<br>
                        <br>
                        <h4>Remove Hold</h4>
                        <input type="radio" name="option2" value="remove" >Remove <br>
                        <input type="radio" name="option2" value="noremove" checked>Not Remove<br>
                        <br>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit<br>
                </form>
                                     
                
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />
