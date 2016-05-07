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
            <div style="font-size: 16px"><a href="../homePage.jsp">Back to HomePage</a></div>
            <form class="form-signup" method="post" action="http://localhost:8080/308code/SignUpServlet" class="ibm-row-form" name="register" id="registerform" >
                <div style="color: #FF0000;">${errorMessage}</div>
                <h2 class="form-signup-heading">Create an Account</h2>
                <label for="fName" class="sr-only">First Name</label>
                <input name="fName" id="inuptFName" class="form-control" placeholder="First Name" required autofocus>
                <div>&nbsp;</div>
                <label for="LName" class="sr-only">Last Name</label>
                <input name="LName" id="inuptLName" class="form-control" placeholder="Last Name" required autofocus>
                <div>&nbsp;</div>
                <label for="UserID" class="sr-only">UserName</label>
                <input name="UserID" id="UserName" class="form-control" placeholder="UserName" required autofocus>
                <div>&nbsp;</div>
                <label for="email" class="sr-only">Email address</label>
                <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <div>&nbsp;</div>
                <label for="phoneNumber" class="sr-only">Phone Number</label>
                <input name="phoneNumber" id="phoneNumber" class="form-control" placeholder="Phone Number" required autofocus>
                <div>&nbsp;</div>
                <label for="password" class="sr-only">Password</label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password"  required>
                <div>&nbsp;</div>
                <label for="Cpassword" class="sr-only">Confirm Password</label>
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
