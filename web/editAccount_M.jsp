

<%@page import="Users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="adminHeader.jsp" />
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />  
    <body>
         <%
            User rs = new User();            
            String Searchname = request.getParameter("name");
            rs = itemManager.findUser(Searchname);
            request.setAttribute("display", rs);
        %>   
        <form method="post" action="http://localhost:8080/308code/ManagerAccountServlet?account=${display.userName}">
        <h2 class="text-center">Change Account settings  <input type="submit" value="submit" /></h2>
        <div class="container"> 
            <table width="430" border="1" align="center" > 
            <body>
            <tr>
                <td height="50"> 
                    <label>New First Name</label>
                    <input type="text" value="${display.firstName}" id="customer_fname" name="customerFName" tabindex="1" >
		</td>
                </tr>
            <tr>
            <tr>
                <td height="50"> 
                    <label>New Last Name</label>
                    <input type="text" value="${display.lastName}" id="customer_lname" name="customerLName" tabindex="1" >
		</td>
                </tr>
            <tr>
                <td height="50">	
                    <label>New email</label>
                    <input type="text" value="${display.email}" id="customer_email" name="customerEmail" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New Phone Number</label>
                    <input type="text" value="${display.phoneNumber}" id="customer_phoneNumber" name="customerphoneNumber" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New password</label>
                    <input type="password" value="${display.password}" id="customer_password" name="customerPassword" tabindex="1" >
                </td>
            </tr>
            
            <tr>
                <td height="50">	
                    <label>New role (1 user, 2 manager)</label>
                    <input type="text" value="${display.role}" id="customer_role" name="customerole" tabindex="1" >
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New lending Period</label>
                    <select name="lendingPreiod">
                        <option value="None">-- Select --</option>
                        <option value="5 minutes">5 minutes</option>
                        <option value="3 days">3 days</option>
                        <option value="7 days">7 days</option>
                        <option value="10 days">10 days</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td height="50">	
                    <label>New Maturity Level</label>
                    <select name="maturityLevel">
                        <option value="None">-- Select --</option>
                        <option value="children">Children</option>
                        <option value="adult">Adult</option>
                    </select>
                </td>
            </tr>
            
              <tr>
                <td height="50">	
                    <label >New display contrast level</label>
                    <input type="range" name="contrastLevel" min="0" max="5">
                        
                </td>
            </tr>
            
     
              <tr>
                <td height="50">	
                    <label>Use Dyslexic Font</label>
                    <select name="fyslexicFont">
                        <option value="None">-- Select --</option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </td>
            </tr>
            
            
            
            
            </tbody>
            </table>
        </div>
        </form>
    </body>
</html>

<jsp:include page="footer.jsp" />