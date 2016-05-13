<%-- 
    Document   : editAccount
    Created on : Apr 20, 2016, 10:13:02 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="memberHeader.jsp" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <body>
            
        <form method="post" action="http://localhost:8080/308code/EditAccountServlet">
        <h2 class="text-center">Change Account settings  <input type="submit" value="submit" /></h2>
        <div class="container"> 
            <table width="400" border="1" align="center" > 
            <tbody>
            <tr>
                <td height="50"> 
                    <label>New First Name</label>
                    <input type="text" value="${itemManager.user.firstName}" id="customer_fname" name="customerFName" tabindex="1" >
		</td>
                </tr>
            <tr>
            <tr>
                <td height="50"> 
                    <label>New Last Name</label>
                    <input type="text" value="${itemManager.user.lastName}" id="customer_lname" name="customerLName" tabindex="1" >
		</td>
                </tr>
            <tr>
                <td height="50">	
                    <label>New email</label>
                    <input type="text" value="${itemManager.user.email}" id="customer_email" name="customerEmail" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New Phone Number</label>
                    <input type="text" value="${itemManager.user.phoneNumber}" id="customer_phoneNumber" name="customerphoneNumber" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New password</label>
                    <input type="password" value="${itemManager.user.password}" id="customer_password" name="customerPassword" tabindex="1" >
                </td>
            </tr>
             <tr>
                <td height="50">	
                    <label>New lending Period</label>
                    <select name="lendingPreiod">
                        <option value="None">-- Select --</option>
                        <option value="5 minutes">5 Minutes</option>
                        <option value="3 days">3 days</option>
                        <option value="7 days">7 days</option>
                        <option value="10 days">10 days</option>
                    </select>
                </td>
            </tr>
            </tbody>
            </table>
        </div>
        </form>
    </body>
    <jsp:include page="footer.jsp" />
</html>