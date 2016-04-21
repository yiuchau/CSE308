<%-- 
    Document   : accountPage
    Created on : Apr 20, 2016, 5:06:08 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script>
            function editAccount(){
                alert("Click OK to edit your account");
                window.location = "./editAccount.jsp";
            }
        </script>
    </head>
    <jsp:include page="memberHeader.jsp" />
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
    <body>
        <h2 class="text-center">Account settings 
            <p>
                <input type="button" value="Edit" onclick="editAccount()">
                <input type="button" value="Delete Account" onclick="deleteAccount()">
                <input type="button" value="LinkAccount" onclick="linkAccount()">
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

