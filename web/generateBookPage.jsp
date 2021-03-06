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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="js/bookPage.js"></script>
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
    
    <c:set item = ${itemManager.findItem(request.getAttribute("isbn"))} />
<div class="col-lg-offset-2 col-lg-8">
    <div class="thumbnail" style="border:none;"> 
        <p class="ratingStars text-center">
        <image id="ratingStar" value = "1" src="images/emptyStar.png"> </image>
        <image id="ratingStar" value = "2" src="images/emptyStar.png"> </image>
        <image id="ratingStar" value = "3" src="images/emptyStar.png"> </image>
        <image id="ratingStar" value = "4" src="images/emptyStar.png"> </image>
        <image id="ratingStar" value = "5" src="images/emptyStar.png"> </image>
        </p>
        <a class="editRating btn btn-primary" role="button" style="width: 120px; height: 30px;"><span  aria-hidden="true" ></span>Edit Rating</a>
        <a class="removeRating btn btn-primary" role="button" style="width: 120px; height: 30px;"><span  aria-hidden="true" ></span>Remove Rating</a>
    <div class="col-sm-4 col-md-4 col-xs-6 col-lg-6">
      <div class="thumbnail"> <a href="#"><img src="${item.imageURL}" alt="Thumbnail Image 1" class="img-responsive"></a>
        <div class="caption">
          <p><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#bookSample" role="button"><span aria-hidden="true" ></span>Sample</a></p>
        </div>
      </div>
    </div>
  </div>
   <div class="col-lg-offset-0 col-lg-6">
       
       <div> 
       <h2>${item.Title}</h2>
      <p>by ${item.Author}</p>
      <p>ISBN: ${item.ISBN}
          <br>
      Publisher: ${item.Publisher}
      <br>
      Release Date: ${item.ReleaseDate}
      <br>
      Average Rating:${item.AverageRating}
      <br>
      Available Copies:${item.AvailableCopies}
      <br>
      Total Copies: ${item.TotalCopies}
      <br></p>
    </div>
   
   <p class="media-body">
       ${item.Description}
   </p>
   
   <p class="media-body">
       ${item.description}
   </p>
   
   <div class="container">
       <a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 30px;" onclick="borrowAction()"><span  aria-hidden="true" ></span>Borrow</a>
       <a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 30px;" onclick="placeHoldAction()"><span class="text-center" aria-hidden="true" ></span>Place Hold</a>
       <a href="#" class="btn btn-primary" role="button" style="width: 120px; height: 30px;" onclick="placeHoldAction()"><span class="text-center" aria-hidden="true" ></span>Add Wishing List</a>
   </p>
   </div>
       
  <div class="container">
  <a class="fb-share-button" 
		data-href="http://localhost:8080/308code/guestBookPage.jsp" 
                data-layout="button_count"> </a>     
  <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
  <a href="https://www.pinterest.com/pin/create/button/">
    <img src="//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png" /></a>
  <a href="mailto:?subject=I wanted you to see this site&amp;body=Check out this site http://www.website.com."
   title="Share by Email">
  <img src="http://png-2.findicons.com/files/icons/573/must_have/48/mail.png">
  </a>
  </div>
  
    	
  </div>
</div>
  
<div class="container">
  <div class="row text-center">
  

  <nav class="text-center">
    <!-- Add class .pagination-lg for larger blocks or .pagination-sm for smaller blocks-->
    <ul class="pagination">
      <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
      <li class="active"><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
    </ul>
  </nav>
</div>
</div>

      <div class="modal fade" id="bookSample" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Book Sample</h4>
        </div>
     
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>
