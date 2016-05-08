<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
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
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Hello, ${itemManager.user.userName} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="./accountPage.jsp">Account Settings</a> </li>
                                <li><a href="./accountsummary.jsp">Account Summary</a> </li>
                                <li><a href="./checkouts.jsp">Checkouts</a> </li>
                                <li><a href="./holds.jsp">Holds</a> </li>
                                <li><a href="./wishlist.jsp">Wishlist</a> </li>
                                <li><a href="./ratelist.jsp">My Rated Titles</a> </li>
                                <li><a href="#">Recommended Books</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="./homePage.jsp" onclick="userManager.signOut()">Sign out</a> </li>
                            </ul>


                                <li><a href="./moreSearch.html">Advanced Search</a> </li>
                          
                        <li><a>Help<a></li>
                                    </ul>
                                    </div>
                                    <!-- /.navbar-collapse --> 
                                    </div>
                                    <!-- /.container-fluid --> 
                                    </nav>
                                    </html>
