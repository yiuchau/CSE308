

<%@page import="Users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>     
    </head>
    <jsp:include page="adminHeader.jsp" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
    <body>
        <%
            User rs = new User();            
            rs = itemManager.findUser(request.getParameter("SearchParameter"));
            request.setAttribute("display", rs);
        %>
        <h2 class="text-center">User Account Settings </h2>
        
        <% if(rs==null){ %>
        
              <h2 class="text-center" >There is no this account!</h2>
              
        <% } else { %>
        <h2 class="text-center">
            <p>
                <form class="navbar-form" action="./editAccount_M.jsp" role="search">
                            <div class="input-group">
                                <input type="hidden" name="name" value="${display.userName}">                                 
                                <div class="input-group-btn">
                                     
                                    <button class="btn btn-default" type="submit">Update</button>
                               
                                </div>
                            </div>
                </form>
                
                <form class="navbar-form" action="http://localhost:8080/308code/managerDeleteA" role="search">
                            <div class="input-group">
                                <input type="hidden" name="name" value="${display.userName}">                                 
                                <div class="input-group-btn">
                                     
                                    <button class="btn btn-default" type="submit">Delet the Account</button>
                               
                                </div>
                            </div>
                </form>
                
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
        <% } %>       
    </body> 
    <jsp:include page="footer.jsp" />
</html>
