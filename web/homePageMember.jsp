<%-- 
    Document   : homePageMember
    Created on : Apr 18, 2016, 9:37:10 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:useBean id="userManager" class="Users.UserManager" scope="session" />    
<jsp:include page="memberHeader.jsp" />
<jsp:include page="generateResult.jsp" />
<jsp:include page="footer.jsp" />
</html>
