

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
#helpODReadIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/od-read-listen.png) no-repeat 0px 0px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}
#helpMediaDoIcon a:hover
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/MediaDoiconSprite.png) no-repeat -103px 0px;
}
#helpMediaDoIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/MediaDoiconSprite.png) no-repeat 0px 0px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}
#helpOMCIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -650px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
}
#helpADEIcon a
{
	background:		url(//libraryreserve.cdn.overdrive.com/210/50/1.46/Help_Sprites.png) no-repeat 0px -760px;
	border:				none;
	float:					left;
	height:					100px;
	margin-right:		15px;
	width:					100px;
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
                
                <h1 class="text-center">Applications</h1>
                
                
                <br>

<div class ="centered" >             
                
                
                <div class="helpresource">
                    <div id="">
                     <a href="http://downloads.live-brary.com/0820A232-9C06-403A-A384-55D38F360DB9/10/50/en/Software.htm"></a>
                    </div>
	
                </div>             
                
<!-- OverDrive Read -->
<div class="helpresource">
	<div id="helpODReadIcon">
		<a target="_blank" href="http://help.overdrive.com/customer/portal/articles/1923948?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" class="ODReadlink"></a>
	</div>
	<div class="helpcopy">
		<div id="helpODReadHeading">
			<p style="font-weight: bold; font-size: large"><span class="od-readMe"><a target="_blank" href="http://help.overdrive.com/customer/portal/articles/1481574?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" class="ODReadlink">OverDrive Read</a></span><span class="mid-sentence"> and</span><span class="od-list"> <a target="_blank" href="http://help.overdrive.com/customer/portal/articles/1909467?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" class="ODReadlink">OverDrive Listen</a></span></p>
		</div>
		<div class="helpblurb"><em class="ODReadText">For <span class="od-readMe">eBooks</span><span class="mid-sentence"> and </span><span class="od-list">Audiobooks</span>. No app or software to install, just click <span class="od-readMe">'Read'</span><span class="mid-sentence"> or </span><span class="od-list">'Listen'</span> and start enjoying your book in your browser.</em></div>
	</div>
</div>

<!-- Media Do Reader -->
<div class="helpresource">
	<div id="helpMediaDoIcon">
		<a target="_blank" href="http://help.overdrive.com/customer/portal/articles/1682037?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" class="MediaDolink"></a>
	</div>
	<div class="helpcopy">
		<div id="helpODReadHeading">
			<p style="font-weight: bold; font-size: large"><a target="_blank" href="http://help.overdrive.com/customer/portal/articles/1682037?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" class="ODReadlink">Media Do Reader</a></p>
		</div>
		<div class="helpblurb"><em class="ODReadText">For Japanese language eBooks. No app or software to install, just click 'Read' and start reading in your browser.</em></div>
	</div>
</div>



<h4>Software Downloads</h4>

<!-- OverDrive  -->
<div class="helpresource">
	<div id="helpOMCIcon">
		<a class="OMClink" href="http://app.overdrive.com/" target="_blank"></a>
	</div>
	<div class="helpcopy">
		<div id="helpOMCHeading">
			<p style="font-weight: bold; font-size: large"><a class="OMClink" href="http://app.overdrive.com/" target="_blank">OverDrive</a></p>
		</div>
		<div class="helpblurb"><em class="OMCtext">For Audiobooks</em></div>
	</div>
</div>

<div class="twelve mobile-four columns ade-dwnld-link" style="display: block;">
<!-- Adobe Digital Editions -->
<div class="helpresource">
	<div id="helpADEIcon">
		<a href="http://www.adobe.com/solutions/ebook/digital-editions.html?" target="_blank"></a>
	</div>
	<div class="helpcopy">
		<div id="helpADEHeading">
			<p style="font-weight: bold; font-size: large"><a href="http://www.adobe.com/solutions/ebook/digital-editions.html?" target="_blank">Adobe Digital Editions</a>
		</p></div>
		<div class="helpblurb"><em class="ADEtext">For eBooks</em></div>
	</div>
</div>
                
                
           

</div>
                
                
                

</div>

</body>
</html>
<jsp:include page="footer.jsp" />

