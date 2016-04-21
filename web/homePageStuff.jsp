<%-- 
    Document   : newjsp
    Created on : Apr 21, 2016, 1:07:08 AM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner">
            <div class="item"> <img class="img-responsive" src="images/header3.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
            <div class="item active"> <img class="img-responsive" src="images/header.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
            <div class="item"> <img class="img-responsive" src="images/EbookSectionHeader.jpg" alt="thumb">
              <div class="carousel-caption"> Welcome to Cedar Library ! </div>
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
      </div>
</div>
    <hr>
  </div>
<div class="container">
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Choose Cedar :) </h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Easy Dowload</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="images/smile.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free for Everything</h4>
        </div>
      </div>
    </div>
  </div>
</div>
    </body>
</html>
