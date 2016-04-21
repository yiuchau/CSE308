<%-- 
    Document   : footer
    Created on : Apr 18, 2016, 9:12:19 PM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap eCommerce Template</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   
</head>
<body>
    <jsp:useBean id="userManager" class="Users.UserManager" scope="session" />
<hr>
  <div class="container well">
    <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
        <div class="row">
          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
            <div>
              <ul class="list-unstyled">
                <li> <a>Services</a> </li>
                <li> <a>Free Download</a> </li>
                <li> <a>Learn a Language</a> </li>
                <li> <a>User Guide</a> </li>
                <li> <a>Book for Kids</a> </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4  col-xs-6">
            <div>
              <ul class="list-unstyled">  
                <li> <a><a href="sign/signUp.html">Sign Up</a></a> </li>
                <li> <a><a href="sign/signIn.html">Login</a></a> </li>
                <li> <a>Connect</a> </li>
                <li> <a><a href="https://docs.google.com/forms/d/1-RB6dMhVFY9lYDFUXEmOwpRVBQZ4afaezy2wo9aE7oc/viewform">Contact Us</a></a> </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
            <div>
              	<a>Team Member</a>
                <li> <a>Brian Lee</a> </li>
                <li> <a>Yiu Chau Lin</a> </li>
                <li> <a>Yue Zhao</a> </li>
                <li> <a>Yi Xie</a> </li>
              
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-5"> 
        <address>
        <strong>Cedar, Inc.</strong><br>
        Stony Brook<br>
        NY, 11790<br>
        <abbr title="Phone">P:</abbr> (631) 420-6969
      </address>
        <address>
        <strong>Cedar</strong><br>
        <a href="mailto:#">Cedar@stonybrook.com</a>
        </address>
        </div>
    </div>
  </div>

<footer class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p>Copyright © Cedar. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
</body>
</html>
