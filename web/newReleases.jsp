<%-- 
    Document   : newReleases
    Created on : Apr 21, 2016, 12:38:06 AM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:useBean id="userManager" class="Users.UserManager" scope="session" />    
<jsp:include page="memberHeader.jsp" />
<jsp:include page="generateNewReleases.jsp" />
<jsp:include page="footer.jsp" />
</html>
