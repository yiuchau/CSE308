<%-- 
    Document   : homePage
    Created on : Apr 18, 2016, 12:57:11 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

   
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="guestHeader.jsp" />
    <jsp:include page="generateResult.jsp" />
    <jsp:include page="footer.jsp" />

</html>
