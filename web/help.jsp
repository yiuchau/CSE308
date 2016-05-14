

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
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat 0px 0px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpODHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -102px 0px;
}

#helpMyHelpIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -2px -866px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpMyHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -105px -866px;
}

#helpTourIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -106px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpTourIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -101px -106px;
}


#helpDRCIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -215px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpDRCIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -102px -215px;
}
#helpLibraryLendingIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -326px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpLibraryLendingIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -103px -326px;
}

#helpSupportIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -436px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#helpSupportIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -103px -436px;
}

#GetSoftwareIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -3px -1082px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#GetSoftwareIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -107px -1082px;
}

#recommendHelpIcon a
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -4px -1187px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}

#recommendHelpIcon a:hover
{
	background:		url(//libraryreserve.cdn.Cedar.com/210/50/1.46/Help_Sprites.png) no-repeat -107px -1187px;
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
                
                <h1 class="text-center">Help</h1>
                
                
                <br>

<div class ="centered" >             
                
                
                <div class="helpresource">
                    <div id="">
                     <a href="http://downloads.live-brary.com/0820A232-9C06-403A-A384-55D38F360DB9/10/50/en/Software.htm"></a>
                    </div>
	
                </div>             
                
<!-- Cedar Help -->
<div class="helpresource">
	<div id="helpODHelpIcon">
		<a href="http://help.Cedar.com/?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true"></a>		
	</div>
	<div class="helpcopy">
		<div id="helpODHelpHeading">
			<p style="font-weight: bold; font-size: large"><a href="http://help.Cedar.com/?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true">Cedar Help</a></p>			
		</div>
            <div class="helpblurb">Watch how-to videos, find answers to your questions, and more.</div>
        </div>
	
</div>
                
                
<!-- Get Software -->
<div class="helpresource">
	<div id="GetSoftwareIcon">
		<a href="./help_application.jsp"></a>
	</div>
	<div class="helpcopy">
		<div id="GetSoftwareHeading">
			<p style="font-weight: bold; font-size: large"><a href="./help_application.jsp">Applications</a></p>
		</div>
		<div class="helpblurb">Information about the applications used for digital media.</div>
	</div>
</div>


<!-- Library Lending Policies (Legacy) -->
<div class="helpresource" id="LendingPolicies">
	<div id="helpLibraryLendingIcon">
		<a href="http://downloads.live-brary.com/0820A232-9C06-403A-A384-55D38F360DB9/10/50/en/help-LendingPolicies.htm"></a>
	</div>
	<div class="helpcopy">
		<div id="helpLibraryLendingHeading">
			<p style="font-weight: bold; font-size: large"><a href="./help_policies.jsp">Library Lending Policies</a></p>
		</div>
		<div class="helpblurb"> Learn how many items you can check out, for how long, and more.</div>
	</div>
</div>

<!-- Recommend to Library -->
<div class="helpresource" style="display: block;" id="recommendHelp">
	<div id="recommendHelpIcon">
		<a href="./help_recom.jsp" target="_blank"></a>
	</div>
	<div class="helpcopy">
		<div id="recommendHelpHeading">
			<p style="font-weight: bold; font-size: large"><a href="./help_recom.jsp" target="_blank">Recommend to Library</a></p>
		</div>
		<div class="helpblurb">Find out how to recommend titles to your library for purchase.</div>
	</div>
</div>
                
 <!-- Support -->
<div class="helpresource" id="supportSection">
	<div id="helpSupportIcon">
		<a href="https://docs.google.com/forms/d/1-RB6dMhVFY9lYDFUXEmOwpRVBQZ4afaezy2wo9aE7oc/viewform"></a>
	</div>
	<div class="helpcopy">
		<div id="helpSupportHeading">
			<p style="font-weight: bold; font-size: large"><a href="https://docs.google.com/forms/d/1-RB6dMhVFY9lYDFUXEmOwpRVBQZ4afaezy2wo9aE7oc/viewform">Support</a></p>
		</div>
		<div class="helpblurb">Still need help? Contact Support.</div>
	</div>
</div>               

</div>
                
                
                

</div>

</body>
</html>
<jsp:include page="footer.jsp" />

