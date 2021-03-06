<%-- 
    Document   : PublisherHomepage
    Created on : Apr 21, 2016, 1:35:42 AM
    Author     : yixxie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PublisherHomepage</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar2"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
      <a class="navbar-brand" href="./homepageMember_publisher.html">Cedar</a></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="defaultNavbar2">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Publisher Home<span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Catalog<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">eBook</a></li>
            <li><a href="#">Audiobook</a></li>
            <li><a href="#">Video</a></li>
            <li class="divider"></li>
            <li><a href="#">More type</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Publisher-unique Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Help Menu</a></li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Options<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container-fluid -->
</nav>
<div class="container">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h2 class="panel-title">Publisher-centric Reports</h2>
        </div>
        <div class="panel-body"> </div>
      </div>
      <div class="panel panel-info">
        <div class="panel-heading">
          <h2 class="panel-title">Licensing Requests</h2>
        </div>
        <div class="panel-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Content ID [Select for Details]</th>
                <th>Existing</th>
                <th>No. Requested</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Avatar: The Last Airbender </td>
                <td>100</td>
                <td>15</td>
              </tr>
              <tr>
                <td>Mary</td>
                <td>Moe</td>
                <td>mary@example.com</td>
              </tr>
              <tr>
                <td>July</td>
                <td>Dooley</td>
                <td>july@example.com</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<hr>
<div class="container well">
  <div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
      <div class="row">
        <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
          <div>
            <li> <a>Servics</a> </li>
            <ul class="list-unstyled">
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
          <div> <a>Team Member</a>
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
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
