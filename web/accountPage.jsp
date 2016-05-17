<%-- 
    Document   : accountPage
    Created on : Apr 20, 2016, 5:06:08 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <jsp:include page="memberHeader.jsp" />
 <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
<html>
    <head>
        <script src="jquery/jquery.js"></script>
        <script type="text/javascript" src='js/bootstrap.min.js'></script>
        <link rel="stylesheet" href="css/bootstrap.css" />
       
        <script>
            function editAccount() {
                alert("Click OK to edit your account");
                window.location = "./editAccount.jsp";
            }
            function deleteAccount() {
                alert("Click OK to delete your account");
                window.location = "http://localhost:8080/308code/DeleteAccountServlet";
            }



        </script>

       
    </head>
    <body>
        <div class="panel panel-primary">
            
        <div class="panel-heading">
        <h2 class="text-center">Account settings 
            
            
        </h2>
        </div>
        
            
                <div class="panel-body">
                    <div class="container text-center">
            <table class="table table-bordered"> 
                <thead>
                <th>Attribute
                </th>
                <th>Value</th>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td>${itemManager.user.firstName} </td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td>${itemManager.user.lastName} </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>${itemManager.user.email}</td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td>
                        <td>${itemManager.user.phoneNumber}</td>
                    </tr>
                    <tr>
                        <td height="50">Password:</td>
                        <td>******</td>
                    </tr>
                    <tr>
                        <td height="50">Lending Period:</td>
                        <td>${itemManager.user.lendingPeriod}</td>
                    </tr>
                    <tr>
                        <td height="50">Maturity Level:</td>
                        <td>${itemManager.user.maturityLevel}</td>
                    </tr>
                </tbody>
            </table>
        </div>
                    
        <div class="btn-group">
                <input type="button" value="Edit" class="btn btn-alert" onclick="editAccount()">
                <input type="button" value="Delete Account" class="btn btn-alert" onclick="deleteAccount()">                
                </div>
                    
                </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>