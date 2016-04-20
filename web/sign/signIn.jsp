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
    <form class="form-signin" method="post" action="http://localhost:8080/308code/LoginServlet" class="ibm-row-form" name="login" id="loginform">
        
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUserName" class="sr-only">Email address</label>
        <input name="inputUserName" type="name" id="inputEmail" class="form-control" placeholder="UserName" required autofocus>
        <div>&nbsp;</div>
<label for="inputPassword" class="sr-only">Password</label>
      <input name="inputPassword" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
      <div style="color: #eee">.</div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in<br>
        </button>
      <div class="checkbox col-md-12">
        <label>
            <input type="checkbox" value="remember-me">
Remember me </label>
        </div>
      <div><span style="text-align: center"></span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="text-align: center; font-size: 16px;">Not a member? &nbsp; </span><a href="signUp.html">Sign Up</a></div>
    </form>

    </div>
<!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
</body>
</html>
