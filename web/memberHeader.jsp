<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session"/>
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
                        <p><strong><a href="./homePageMember.jsp">Cedar Library</a></strong></p>
                    </blockquote>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav"> 
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Catalog<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="./eBooks.jsp">eBook</a> </li>
                                <li><a href="./audiobooks.jsp">Audiobook</a> </li>
                                <li><a href="./videos.jsp">Video</a> </li>
                                <li role="separator" class="divider"></li>
                                <li><a href="./moreTypePage.html">More types</a> </li>
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
                        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Hello, ${itemManager.user.userName} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="./accountPage.jsp">Account Settings</a> </li>
                                <li><a href="./accountsummary.jsp">Account Summary</a> </li>
                                <li><a href="./checkouts.jsp">Checkouts</a> </li>
                                <li><a href="./holds.jsp">Holds</a> </li>
                                <li><a href="./wishlistB.jsp">Wishlist</a> </li>
                                <li><a href="./ratelist.jsp">My Rated Titles</a> </li>
                                <li><a href="./recommended.jsp">Recommended Books</a></li>
                                 <% if(itemManager.getUser().getRole()==2){ %>
                                    <li><a href="./adminHomepage.jsp">Admin Home</a></li>
                                <% } %>
                                <li role="separator" class="divider"></li>
                                <li><a href=http://localhost:8080/308code/LogoutServlet>Sign out</a> </li>
                            </ul>
                        <li><a href="./AdvancedSearch.jsp">Advanced Search</a> </li>
                        <li><a href="./help.jsp">Help</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
