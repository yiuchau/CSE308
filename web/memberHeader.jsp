<%-- 
    Document   : memberHeader
    Created on : Apr 18, 2016, 10:09:11 PM
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

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <blockquote>
        <p><strong><a href="./homePageMember.jsp">Cedar Library</a></strong></p>
      </blockquote>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav"> 
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Catalog<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="./eBooks.jsp">eBook</a> </li>
            <li><a href="./audiobooks.jsp">Audiobook</a> </li>
            <li><a href="./videos.jsp">Video</a> </li>
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
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Hello, ${userManager.user.userName} <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="./accountPage.jsp">Account Settings</a> </li>
            <li><a href="./myCollection.jsp">Checkouts</a> </li>
            <li><a href="./listPage.html">Account Summary</a> </li>
            <li><a href="./unreadPage.html">Holds</a> </li>
            <li><a href="./recommendPage.html">Recommendations</a> </li>
            <li><a href="./recommendPage.html">Wishlist</a> </li>
            <li><a href="./inboxPage.html">My Rated Titles</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="./homePage.jsp" onclick="userManager.signOut()">Sign out</a> </li>
        </ul>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Advance Search <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <li><a href="./mostPopular.jsp">Most Popular</a> </li>
            <li><a href="./newReleases.jsp">New Releases</a> </li>
            <li><a href="./topHolds.jsp">Top Holds</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="./moreSearch.html">Advanced Search</a> </li>
          </ul>
        </li>
        
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
</html>
