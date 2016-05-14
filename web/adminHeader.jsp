<%-- 
    Document   : adminHeader
    Created on : May 13, 2016, 3:31:56 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PublisherHomepage</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar2"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a class="navbar-brand" href="./homePageMember.jsp">Cedar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        </div>
       
        <div class="nav navbar-nav ">
            <a class=" navbar-brand" href="#">Admin Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
        </div>
        
         <div class="nav navbar-nav">
             <a class=" navbar-brand" href=http://localhost:8080/308code/LogoutServlet>Sign out, ${itemManager.user.userName}</a> </li>
        </div>
        
     
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="defaultNavbar2">
            <ul class="nav navbar-nav ">
                <li class="active"><a href="#">&nbsp;&nbsp;&nbsp;<span class="sr-only"></span></a></li>
                <li class="active"><a href="./banBook.jsp">Ban a book<span class="sr-only"></span></a></li>
                <li class="active"><a href="./unbanBook.jsp">Unban a book<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">Modify book information<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">Review book recommendations<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">Buy book licenses<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">Account management<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">Best seller list<span class="sr-only"></span></a></li>
                <li class="active"><a href="#">&nbsp;&nbsp;&nbsp;<span class="sr-only"></span></a></li>
        </ul>
        
       
        </li>
      </ul>
     </div>
    <!-- /.navbar-collapse -->
  </div>
</body>
</html>