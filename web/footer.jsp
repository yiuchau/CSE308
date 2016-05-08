<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.css">
   </head>
<body>
    <jsp:useBean id="itemManager" class="Items.ItemManager" scope="session" />
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
                <li> <a>Books for Kids</a> </li>
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
        <abbr title="Phone">P:</abbr> (631) 000-0000
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
