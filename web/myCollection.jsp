<%-- 
    Document   : myCollection
    Created on : Apr 21, 2016, 1:00:41 AM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <%-- TESTING, DO NO REMOVE <jsp:include page="header.jsp" /> --%>
    <jsp:include page="memberHeader.jsp" />
    <jsp:include page="generateMemberCollection.jsp" />
    <jsp:include page="footer.jsp" />
</html>
