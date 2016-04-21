<%-- 
    Document   : guestBookPage
    Created on : Apr 20, 2016, 4:37:19 PM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />  
    <jsp:include page="guestHeader.jsp" />
    <jsp:include page="generateBookPage.jsp" />
    <jsp:include page="footer.jsp" />
</html>
