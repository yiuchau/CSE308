
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<nav>
  <div class="container"> 
    
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <blockquote>
        <p><strong><a href="homePage.jsp">Cedar Library</a></strong></p>
      </blockquote>
    </div>
    
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav"> 
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Catalog<span class="caret"></span></a>
                            
                                
                            <ul class="dropdown-menu">
                                
                                <li><a href="./SearchResults.jsp?SearchType=advanced&format=0">EBook</a> </li>
                                <li><a href="./SearchResults.jsp?SearchType=advanced&format=1">Audiobook</a> </li>
                                <li><a href="./SearchResults.jsp?SearchType=advanced&format=2">Video</a> </li>
                                
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./SearchResults.jsp?SearchType=advanced&sort=releaseDate">New Releases</a> </li>
                                    <li><a href="./SearchResults.jsp?SearchType=advanced&sort=borrowedTimes">Most Popular</a> </li>
                                    <li><a href="./SearchResults.jsp?SearchType=advanced&sort=averageRating">Top Rated</a> </li>
                                <li role="separator" class="divider"></li>
                                <li><a href="./Genres.jsp">Genres</a> </li>
                                       
                                
                            </ul>
                        </li>
        </ul>
                    <div class="col-sm-3 col-md-3 pull-right">
                        
                        <form class="navbar-form" action="./SearchResults.jsp" role="search">
                            <div class="input-group"> 
                                
                                <input type="hidden" name="SearchType" value="basic">  
                                <input type="text" class="form-control" placeholder="Search" name="SearchParameter" id="SearchParameter">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="./signIn.jsp">Login</a></li>
        <li><a href="./signUp.jsp">Account Registration</a> </li>
        <li><a href="./AdvancedSearch.jsp">Advanced Search</a> </li>
        <li><a href="./help.jsp">Help<a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
</html>