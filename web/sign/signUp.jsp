<%-- 
    Document   : signIn
    Created on : Apr 20, 2016, 3:47:45 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
  	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
      <div style="font-size: 16px"><a href="../homePage.jsp">Back to HomePage</a></div>
      <form class="form-signup" method="post" action="http://localhost:8080/308code/SignUpServlet" class="ibm-row-form" name="register" id="registerform" >
        
        <h2 class="form-signup-heading">Create an Account</h2>
       
        <label for="inputFName" class="sr-only">First Name</label>
        <input name="fName" id="inuptFName" class="form-control" placeholder="First Name" required autofocus>
        <div>&nbsp;</div>
        <label for="inputLName" class="sr-only">Last Name</label>
        <input name="LName" id="inuptLName" class="form-control" placeholder="Last Name" required autofocus>
        <div>&nbsp;</div>
         
        <label for="inputUserID" class="sr-only">UserName</label>
        <input name="UserID" id="UserName" class="form-control" placeholder="UserName" required autofocus>
        <div>&nbsp;</div>
        
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <div>&nbsp;</div>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password"  required>
        <div>&nbsp;</div>
        
        <label for="inputCPassword" class="sr-only">Confirm Password</label>
        <input type="password" name="Cpassword" id="inputCPassword" class="form-control" placeholder="Confirm Password" required>
        <div>&nbsp;</div>
        <div class="signUpRole">
            <label> Sign up as: </label>
            <select name="role">
                    <option value="member">Member</option>
                    <option value="admin">Administrator</option>
 		    <option value="publisher">Publisher</option>
  	    </select>
        </div>
        <div class="checkbox">
      		<label>
                    <input type="checkbox" value="remember-me"> Remember me
   		</label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button></a>
    </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
