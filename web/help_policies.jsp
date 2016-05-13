

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="memberHeader.jsp" />
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
        </head>
       
        
 <body> 
        <div class="container">
                
      
            <br>
            <h1 class="text-center">Library Lending Policies</h1>
                
            <br>    


<a href="http://downloads.live-brary.com/0820A232-9C06-403A-A384-55D38F360DB9/10/50/en/BANGAuthenticate.dll?Action=AuthCheck&amp;URL=MyAccount.htm&amp;ForceLoginFlag=0"> </a>
         
            



<h3>Borrowing</h3>
<p class="first">You can borrow up to 7 titles<span class="Nook-lending-policies" style="display: none;"> and 3 periodicals</span> at a time. <span class="lp-no">The lending period may vary from title to title.</span> You will need an active library card to borrow titles from this library. Please visit the library's website or a local branch to learn more about its library card policy.</p>


<h3>How to change your lending periods</h3>
<ol>
<li><a href="./signIn.jsp">Sign in to your account.</a></li>
<li>Click the <b>Account Settings</b> link.</li>
<li>Select your preferred lending period for each format.</li>
</ol>
<!--<img src="//libraryreserve.cdn.overdrive.com/210/50/1.46/changeLendingPeriods.jpg" title="How to change your lending period" alt="How to change your lending period" />-->



<h3>Returning &amp; renewing</h3>
<p class="first">Some titles can be returned before they expire. If you have not downloaded a title, you’ll be able to return it from your <strong>Checkouts</strong> page. If you download a title, its <b>Return Title</b> button will disappear from your <strong>Checkouts</strong> page, but you may be able to return it using <a href="http://help.overdrive.com/customer/portal/articles/1481263?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank" alt="How to return a title">these steps</a>. The option to renew a title will appear on your <strong>Checkouts</strong> page within 3 days of the title’s expiration date. Learn more about how to renew titles <a href="http://help.overdrive.com/customer/portal/articles/1481523?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank" alt="How to renew a title">here</a>.</p>



<p class="helpHeading">Returning &amp; Renewing</p>
<p class="first">Some titles can be returned before they expire. If you have not downloaded a title, you’ll be able to return it from your <strong>Checkouts</strong> page. If you download a title, its <b>Return Title,</b> button will disappear from your <strong>Checkouts</strong> page, but you may be able to return it using <a href="http://help.overdrive.com/customer/portal/articles/1481263?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank" alt="How to return a title">these steps</a>. You cannot renew titles, but you can borrow them again after they expire if they are still available.</p>


<h3>Holds</h3>
<p class="first">You can place up to 5 titles on hold at a time. You’ll receive an email notification when a title you placed on hold becomes available. Once the email is sent, you’ll have 3 days (72 hours) to borrow the title before your hold is cancelled.  Or, you can turn on <a href="http://help.overdrive.com/customer/portal/articles/1626175?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank">automatic borrowing</a> to make sure you never miss a hold.  <span class="Nook-lending-policies" style="display: none;">Please note that you can't place holds on periodicals.</span></p>

<h3>Suspending holds</h3>
<p class="first">If you’re not ready for a hold to become available yet, you can temporarily suspend it by following <a href="http://help.overdrive.com/customer/portal/articles/1626174?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank">these steps</a>. You can suspend each hold for a minimum of 7 days and a maximum of 90 days. Please note that you can’t suspend holds on <a href="http://help.overdrive.com/customer/portal/articles/1481523?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank">renewed titles</a> or <a href="http://help.overdrive.com/customer/portal/articles/1964385?Sup=http://downloads.live-brary.com/Support.htm&amp;nextgen=true" target="_blank">titles you’ve requested again</a>.</p>

<h3>How to cancel a hold</h3>
<ol>
		<li><a href="./signIn.jsp">Sign in to your account</a>.</li>
		<li>Click the <b>Holds</b> link.</li>		
		<li>Select the <b>Remove hold</b> option.</li>
</ol>


<h3>How to change your holds email address</h3>
<ol>
		<li><a href="./signIn.jsp">Sign in to your account</a>.</li>
		<li>Click the <b>Holds</b> link.</li>
		<li>Click the <b>Options</b> button.</li>
		<li>Select the <b>Edit email address</b> option.</li>
		<li>Enter your new email address in both required fields.</li>
		<li>Click <b>Update</b> to update your email address for the selected title. </li>
</ol>



<p class="helpHeading" style="display:none;">Recommendation Policy</p>
<p class="first" style="display:none;">You can recommend up to 2 titles every 7 days.</p>

</div> 
    
               

</div>

</body>
</html>
<jsp:include page="footer.jsp" />

