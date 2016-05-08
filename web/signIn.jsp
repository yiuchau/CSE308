<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="../../favicon.ico">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div style="font-size: 16px"><a href="http://localhost:8080/308code/homePage.jsp">Return to HomePage</a></div>
            <form class="form-signin" method="post" action="http://localhost:8080/308code/LoginServlet" class="ibm-row-form" name="login" id="loginform">
                <div style="color: #FF0000;">${errorMessage}</div>
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="inputUserName" class="sr-only">Username</label>
                <input name="inputUserName" type="name" id="inputEmail" class="form-control" placeholder="UserName" required autofocus>
                <div>&nbsp;</div>
                <label for="inputPassword" class="sr-only">Password</label>
                <input name="inputPassword" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <div>&nbsp;</div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in<br>
                </button>
                <div class="checkbox col-md-12">
                    <label>
                        <input type="checkbox" value="remember-me">
                        Remember me </label>
                </div>
                <div><span style="text-align: center; font-size: 16px;">Not a member? &nbsp; </span><a href="./signUp.jsp">Sign Up</a></div>
            </form>

        </div>
        <!-- /container -->


        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    </body>
</html>
