
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />

<!DOCTYPE html>
<html>
    <jsp:include page="guestHeader.jsp" />
    <jsp:include page="Ads.jsp" />
    <jsp:include page="homePageContent.jsp" />
    <jsp:include page="footer.jsp" />
</html>
