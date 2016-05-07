<%-- 
    Document   : bookPage
    Created on : Apr 20, 2016, 10:13:30 PM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
<jsp:include page="header.jsp" />
<jsp:include page="generateBookResult.jsp" />
<jsp:include page="footer.jsp" />
</html>
