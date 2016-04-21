<%-- 
    Document   : editAccount
    Created on : Apr 20, 2016, 10:13:02 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="memberHeader.jsp" />
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
    <body>
        <form method="post" action="http://localhost:8080/308code/EditAccountServlet">
        <h2 class="text-center">Change Account settings  <input type="submit" value="submit" /></h2>
        <div class="container"> 
            <table width="400" border="1" align="center" > 
            <tbody>
            <tr>
                <td height="50"> 
                    <label>New First Name</label>
                    <input type="text" value="${userManager.user.firstName}" id="customer_fname" name="customerFName" tabindex="1" >
		</td>
                </tr>
            <tr>
            <tr>
                <td height="50"> 
                    <label>New Last Name</label>
                    <input type="text" value="${userManager.user.lastName}" id="customer_lname" name="customerLName" tabindex="1" >
		</td>
                </tr>
            <tr>
                <td height="50">	
                    <label>New email</label>
                    <input type="text" value="${userManager.user.email}" id="customer_email" name="customerEmail" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New password</label>
                    <input type="text" value="${userManager.user.password}" id="customer_password" name="customerPassword" tabindex="1" >
                </td>
            </tr>
            </tbody>
            </table>
        </div>
        </form>
    </body>
    <jsp:include page="footer.jsp" />
</html>