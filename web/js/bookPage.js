/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var submitRatingTimeout;
var showStarsTimeout;
var editRatingTimeout;

function submitRating(){
    showStarsTimeout = window.setInterval(showStars,1000);
    
    $(".ratingStars").children("#ratingStar").on("click", function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png");
        }
        $(".ratingStars").children("#ratingStar").off("click mouseover mouseleave");
        window.clearInterval(showStarsTimeout);
	});
        
}

function showStars(){
    $(".ratingStars").children("#ratingStar").on("mouseover", function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png");
        }
	});
    $(".ratingStars").children("#ratingStar").on("mouseleave", function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/emptyStar.png");
        }
	});
}

function staticStars(amount){
        amount++;
        for (var i = 1; i <amount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png");
        }
}
function editRating(){
        showStarsTimeout = window.setInterval(showStars,1000);
        $(".ratingStars").children("#ratingStar").attr("src","images/emptyStar.png");
        showStars();
        $(".ratingStars").children("#ratingStar").on("click", function(){
            $(".editRatingActive").toggleClass("editRating editRatingActive btn-danger btn-success");
            var starAmount = $(this).attr("value");
            starAmount++;
            for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png");
        }
        $(".ratingStars").children("#ratingStar").off("click mouseover mouseleave");
        window.clearInterval(showStarsTimeout);
    });
}
$(document).ready(function submitRatingListener(){
    //submitRating();
    //showStars();
    //staticStars(2);
});


$(document).ready(function editRatingListener(){
/* Class name changes, but event handler still stuck on element even after class name change, 
 * AND does not respond to "editRatingActive". I think the event handlers are just attached one time
 * document is loaded or something like that.
 * Probably can make a second button right on top of old one for temp fix but not sure
 * how to do it legitimately so don't spam click Edit Rating and it will work fine.
 */
    $(".editRating").on("click", function(){
        /* alert($(this).attr("class")); */
        editRating();
        $(".editRating").toggleClass("editRating editRatingActive btn-danger btn-success");
        /*alert($(this).attr("class") ); */
        });
/*        
    $(".editRatingActive").on("click", function(){
        alert("editRatingActive" );
            $(".editRating").on("click", function(){
            $(".editRating").toggleClass("editRating editRatingActive btn-danger btn-success");
        });
        });
*/  
});


$(document).ready(function removeRatingListener(){
    $(".removeRating").click(function(){
    $(".ratingStars").children("#ratingStar").attr("src","images/emptyStar.png");
    submitRating();
    showStars();
    });
});