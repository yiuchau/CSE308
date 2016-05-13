

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    
    <html lang="en">
 
        </script><style>
/** general layout and formatting **/

img
{
	border:				none;
}

.helpblurb
{
	font-family:			"Myriad Pro", sans-serif;
	font-size:				small;
	margin:				0px;
}

.helpresource
{
	display:				block;
	margin-top:		10px;
	overflow:				hidden;
	width:					400px;
}

.centered
{
    margin: auto;
    width: 400px;
    height: 600px;
}

/** sprites **/
/** css shown in order of appearance on the page **/

#helpODHelpIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px 0px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpODHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -102px 0px;
}

#helpMyHelpIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -2px -866px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpMyHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -105px -866px;
}

#helpTourIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -106px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpTourIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -101px -106px;
}


#helpDRCIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -215px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpDRCIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -102px -215px;
}
#helpLibraryLendingIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -326px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpLibraryLendingIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -103px -326px;
}

#helpSupportIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -436px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpSupportIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -103px -436px;
}

#GetSoftwareIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -3px -1082px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#GetSoftwareIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -107px -1082px;
}

#recommendHelpIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -4px -1187px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#recommendHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat -107px -1187px;
}

</style>
    
    
        <head>
            <link rel="stylesheet" href="css/bootstrap.css">
            <c:choose>
            <c:when test="${itemManager.user==null}">
                <jsp:include page="guestHeader.jsp" />
            </c:when>    
            <c:otherwise>
                <jsp:include page="memberHeader.jsp" />
            </c:otherwise>
            </c:choose>
        </head>
       
        
 <body> 
        <div class="container">
                
      
            <br>
            <h1 class="text-center">Library Lending Policies</h1>
                
            <br>    


<a href="http://downloads.live-brary.com/0820A232-9C06-403A-A384-55D38F360DB9/10/50/en/BANGAuthenticate.dll?Action=AuthCheck&amp;URL=MyAccount.htm&amp;ForceLoginFlag=0"> </a>
         
            



<h3>How to recommend titles that you'd like your library to add to its collection</h3>
<p>
    You can use the steps below to browse through digital titles that your library doesn't own yet. You can then make recommendations to let your library know what you'd like to be added to the digital collection.
</p>

<p>
    Note: If you recommend a title to your library, there is no guarantee they will purchase it. 
</p>

<p>
    1.After you search for something in your library's digital collection, click the book and go into book page.
</p>

<p>
    2.Please click the Recommend button.
</p>

<p>
    3.Please input your email address and choose the checkout type when this book becomes available.
</p>
<p>
    4.Click the submit button.
</p>
</div> 
    
               

</div>

</body>
</html>
<jsp:include page="footer.jsp" />

