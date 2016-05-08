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
            function deleteAccount(){
                alert("Click OK to delete your account");
                window.location = "http://localhost:8080/308code/DeleteAccountServlet";
            }
             function linkAccount(){
                alert("Click OK to link your account. Build later");
            }
            
        </script>
    </head>
    <jsp:include page="memberHeader.jsp" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
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
                    <td height="50"> First Name:	${itemManager.user.firstName} </td>
                </tr>
                <tr>
                     <td height="50"> Last Name:	${itemManager.user.lastName} </td>
                </tr>
                <tr>
                    <td height="50">	Email:          ${itemManager.user.email}</td>
                </tr>
                 <tr>
                     <td height="50">	Phone Number:   ${itemManager.user.phoneNumber}</td>
                </tr>
                <tr>
                    <td height="50"><font color="red">*UserName[Can't be changed]:${itemManager.user.userName}</font></td>
                </tr>
                <tr>
                    <td height="50">	Password:	******</td>
                </tr>
            </tbody>
            </table>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>