<%-- 
    Document   : header
    Created on : Apr 18, 2016, 9:05:51 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap eCommerce Template</title>
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <blockquote>
        <p><strong><a href="homePage.jsp">Cedar Library</a></strong></p>
      </blockquote>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav"> 
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Catalog<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="./eBooks.jsp">eBooks</a> </li>
            <li><a href="./audiobooks.jsp">Audiobooks</a> </li>
            <li><a href="./videos.jsp">Videos</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="./moreTypePage.html">More type</a> </li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="sign/signIn.jsp">Login</a></li>
        <li><a href="sign/signUp.jsp">Account Registration</a> </li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Advance Search <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <li><a href="./mostPopular.jsp">Most Popular</a> </li>
            <li><a href="./newReleases.jsp">New Releases</a> </li>
            <li><a href="./topHolds.jsp">TopHolds</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="./moreSearch.html">More Search</a> </li>
          </ul>
        </li>
        <li><a>Help<a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
</html>