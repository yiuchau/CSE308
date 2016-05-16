<%-- 
    Document   : buyLicenses
    Created on : May 16, 2016, 1:19:13 AM
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
                <div class="row text-center"> 
                    <h1 align="center">Purchase Licenses</h1>
                    <h3 align="center" style="color:#008000;">${successMessage}</h3>
                    <h3 align="center" style="color:#FF0000;">${errorMessage}</h3>
                    <div class="caption">
                        <div class="thumbnail "> <img src="${imageURL}" style="width:120px;height:200px;" class="img-responsive"></a>
                            <font size="2">${title}</font>
                        </div>
                    </div>
                </div>
                <form role="form" action="./adminServlet?type=purchaseRecommendation&isbn=${ISBN}" method="POST">
                   <div>
                        <h2>Please enter the amount you want to purchase:</h2>
                    </div>
                        <br>
                            <input name="amount" type="text" id="amount" class="form-control" placeholder="Amount" required autofocus> 
                        <br>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit<br>
        
                </form>
                                     
                
            </div>
        </body>
    </html>
    <jsp:include page="footer.jsp" />
