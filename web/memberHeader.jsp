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
<jsp:useBean id="loggedInUser" class="Users.User" scope="application" />
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
            <li><a href="./eBook.html">eBook</a> </li>
            <li><a href="./AudioBook.html">Audiobook</a> </li>
            <li><a href="./Video.html">Video</a> </li>
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
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Hello, ${loggedInUser.userName} <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="./accountPage.html">Account settings</a> </li>
            <li><a href="./listPage.html">View my collection</a> </li>
            <li><a href="./listPage.html">View my downloads</a> </li>
             <li><a href="./unreadPage.html">View announcements</a> </li>
            <li><a href="./recommendPage.html">Your recommendations</a> </li>
             <li><a href="./inboxPage.html">Inbox</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="#" onclick="signOut()">Sign out</a> </li>
        </ul>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Advance Search <span class="caret"></span></a>
          <ul class="dropdown-menu">
           <li><a href="./popularest.html">the popularest</a> </li>
            <li><a href="./newRelease.html">New Releases</a> </li>
            <li><a href="./Price.html">TopHolds</a> </li>
            <li role="separator" class="divider"></li>
            <li><a href="./moreSearch.html">More Search</a> </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
<div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner">
            <div class="item"> <img class="img-responsive" src="images/header3.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
            <div class="item active"> <img class="img-responsive" src="images/header.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
            <div class="item"> <img class="img-responsive" src="images/EbookSectionHeader.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
      </div>
</div>
    <hr>
  </div>
<div class="container">
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Choose Cedar :) </h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Easy Dowload</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free for Everything</h4>
        </div>
      </div>
    </div>
  </div>
</div>
</html>
