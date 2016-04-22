<%-- 
    Document   : accountPage
    Created on : Apr 20, 2016, 5:06:08 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="js/accountSettings.js"></script>
    </head>
    <jsp:include page="memberHeader.jsp" />
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
    <body>
        <h2 class="text-center">Account settings 
            <p>
                <input type="button" class = "editAccount" value = "Edit Account"> 
                <input type="button" class = "deleteAccount" value = "Delete Account"> 
                <input type="button" class = "linkAccount" value = "Link Account"> 
            </p>
        </h2>
        <div class="container"> 
            <table width="400" border="1" align="center" > 
            <tbody>
                <tr>
                    <td height="50"> First Name:	${userManager.user.firstName} </td>
                </tr>
                <tr>
                     <td height="50"> Last Name:	${userManager.user.lastName} </td>
                </tr>
                <tr>
                    <td height="50">	Email:          ${userManager.user.email}</td>
                </tr>
                <tr>
                    <td height="50"><font color="red">*UserName[Can't be changed]:${userManager.user.userName}</font></td>
                </tr>
                <tr>
                    <td height="50">	Password:	${userManager.user.password}</td>
                </tr>
            </tbody>
            </table>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>

