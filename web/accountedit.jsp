

<%@page import="Users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script>
            function editAccount(){
                alert("Click OK to edit user account");
                window.location = "./editAccount_M.jsp";
            }
            function deleteAccount(){
                alert("Click OK to delete user account");
                window.location = "http://localhost:8080/308code/DeleteAccountServlet";
            }          
         </script>
    </head>
    <jsp:include page="adminHeader.jsp" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <body>
        <%
            User rs = new User();            
            rs = itemManager.findUser(request.getParameter("SearchParameter"));
            request.setAttribute("display", rs);
        %>
        <h2 class="text-center">User Account Settings 
            <p>
                <form class="navbar-form" action="./editAccount_M.jsp" role="search">
                            <div class="input-group">
                                <input type="hidden" name="name" value="${display.userName}">                                 
                                <div class="input-group-btn">
                                     
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                               
                                </div>
                            </div>
                </form>
                
                <input type="button" value="Delete Account" onclick="deleteAccount()">
                
            </p>
        </h2>
        <div class="container"> 
            <table width="400" border="1" align="center" > 
            <tbody>
                <tr>
                    <td height="50"> First Name:	${display.firstName} </td>
                </tr>
                <tr>
                     <td height="50"> Last Name:	${display.lastName} </td>
                </tr>
                <tr>
                    <td height="50">	Email:          ${display.email}</td>
                </tr>
                 <tr>
                     <td height="50">	Phone Number:   ${display.phoneNumber}</td>
                </tr>
                <tr>
                    <td height="50">	Password:	******</td>
                </tr>
                <tr>
                    <td height="50">	Lending Period:	${display.lendingPeriod}</td>
                </tr>
                <tr>
                    <td height="50">	Maturity Level:	${display.maturityLevel}</td>
                </tr>
                <tr>
                    <td height="50">	User Role:	${display.role}</td>
                </tr>
            </tbody>
            </table>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>