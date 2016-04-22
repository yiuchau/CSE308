<%-- 
    Document   : generateBookPage
    Created on : Apr 20, 2016, 4:15:43 PM
    Author     : Brian Lee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/custom.css">
        <script src="js/custom.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script>
!function(d,s,id){
    var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
    if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}
    }(document, 'script', 'twitter-wjs');</script>

<script
    type="text/javascript"
    async defer
    src="//assets.pinterest.com/js/pinit.js"
></script>
<div>
    
  <div class="col-lg-offset-2 col-lg-8">
    <h2 class="text-center">Book Name</h2>
    <div class="thumbnail" style="border:none;"> 
        <image id="ratingStar1" value = "1" onclick= "sendReview(1)" onmouseover = "hoverReview(1)" onmouseout ="unhoverReview(1)" src="images/emptyStar.png"> </image>
        <image id="ratingStar2" value = "2" onclick= "sendReview(2)" onmouseover = "hoverReview(2)" onmouseout ="unhoverReview(2)" src="images/emptyStar.png"> </image>
        <image id="ratingStar3" value = "3" onclick= "sendReview(3)" onmouseover = "hoverReview(3)" onmouseout ="unhoverReview(3)" src="images/emptyStar.png"> </image>
        <image id="ratingStar4" value = "4" onclick= "sendReview(4)" onmouseover = "hoverReview(4)" onmouseout ="unhoverReview(4)" src="images/emptyStar.png"> </image>
        <image id="ratingStar5" value = "5" onclick= "sendReview(5)" onmouseover = "hoverReview(5)" onmouseout ="unhoverReview(5)" src="images/emptyStar.png"> </image>
    <div class="col-sm-4 col-md-4 col-xs-6 col-lg-6">
      <div class="thumbnail"> <a href="context.html"><img src="images/book1.jpg" alt="Thumbnail Image 1" class="img-responsive"></a>
        <div class="caption">
          <h3>Author</h3>
          <p>Review of the book.....</p>
          <p><a href="#" class="btn btn-primary" role="button" onClick="window.open('./memberBookPage.jsp');" ><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" ></span>Sample</a></p>
        </div>
      </div>
    </div>
  </div>
   <div class="col-lg-offset-0 col-lg-6">
   
   
   <h2 class="text-center">Book Name</h2>
   <p class="media-body">
   Description of the book.
   VOGUE was founded in 1892, it has a long history and been widely respected in fashion world. The magazine covering fashion, makeup, beauty, health, entertainment and arts fields, it is a 		    comprehensive lifestyle magazine.

	Since VOGUE was launched in the US in 1892, it has overwhelmingly been regarded as the world's Fashion Bible.

	The American edition of VOGUE magazine was started in 1892, its publisher Condé Nast Company later launched a British version in the year 1916 and France version in 1921. Nast is the 	    founder of modern magazine layout. He was the first to employ artists as publisher of magazine photographers.The VOGUE magazine is also the first magazine to use colorful photography to      express the fashion works.

    The VOGUE magazine made from a unique perspective to reflect the local culture. Her supporting role for related industry is unmatched. Mostly deserve to be mentioned is that the VOGUE   Magazine promoted the development of the global fashion industry. Many famous designers today are originally found by it.

  The VOGUE  put the emphasis on policy of editorial independence and adhering to the highest standard of editing purposes.Each month's VOGUE magazine has the world's 18 million most influential loyal readers. Around the world, the VOGUE magazine designers, writers and artists honored as authoritative style and fashion.
   
   </p>
   
   <p class="text-center"><a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 30px;" onclick="borrowAction()"><span  aria-hidden="true" ></span>Borrow</a>
   <a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 30px;" onclick="placeHoldAction()"><span class="text-center" aria-hidden="true" ></span>Place Hold</a>
   <div>
  <a class="fb-share-button" 
		data-href="https://www.facebook.com/" 
                data-layout="button_count"> </a>     
  <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
  <a href="https://www.pinterest.com/pin/create/button/">
    <img src="//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png" /></a>
  <a href="mailto:?subject=I wanted you to see this site&amp;body=Check out this site http://www.website.com."
   title="Share by Email">
  <img src="http://png-2.findicons.com/files/icons/573/must_have/48/mail.png">
  </a>
   </div>
  
    <p class="text-center">
    <textarea name="Text1" cols="35" rows="5" >Write your review </textarea>
    </p>
    <p class="text-center">
     <a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 25px;" onclick="updateReview()"><span class="text-center" aria-hidden="true" ></span>Submit Riview</a></p>		
  </div>
</div>
    
<hr>
<hr>
<div class="container">
<div class="row text-center">
  
  <h2 class="text-center"> </h2>
</div>
</div>




<hr>
<hr>
 

<hr>
<div class="container">
  <div class="row text-center">
  <div class="row text-center">
  
  <h2 class="text-center"> The Recommended Books </h2>
  </div>
  
    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
      <div class="thumbnail"> <a href="context.html"><img src="images/book1.jpg" alt="Thumbnail Image 1" class="img-responsive"></a>
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a></p>
        </div>
      </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
      <div class="thumbnail"> <img src="images/book2.jpg" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download </a> </p>
        </div>
      </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
      <div class="thumbnail"> <img src="images/book3.jpg" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a> </p>
        </div>
      </div>
    </div>
    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6 hidden-lg hidden-md hidden-sm">
      <div class="thumbnail"> <img src="images/400X200.gif" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row text-center hidden-xs">
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <div class="thumbnail"> <img src="images/book4.jpg" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a> </p>
        </div>
      </div>
    </div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <div class="thumbnail"> <img src="images/5.jpg" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a> </p>
        </div>
      </div>
    </div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <div class="thumbnail"> <img src="images/6.jpg" alt="Thumbnail Image 1" class="img-responsive">
        <div class="caption">
          <h3>Product</h3>
          <p>Description of the book.</p>
          <p><a href="#" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Download</a> </p>
        </div>
      </div>
    </div>
  </div>
  <nav class="text-center">
    <!-- Add class .pagination-lg for larger blocks or .pagination-sm for smaller blocks-->
    <ul class="pagination">
      <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
      <li class="active"><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li class="disabled"><a href="#">5</a></li>
      <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
    </ul>
  </nav>
</div>
</body>
</html>
