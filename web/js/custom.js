/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function hoverReview(value){
    switch (value){
        case 1:
            document.getElementById("ratingStar1").src="images/filledStar.png";
            break;
        case 2:
            document.getElementById("ratingStar1").src="images/filledStar.png";
            document.getElementById("ratingStar2").src="images/filledStar.png";
            break;
        case 3:
            document.getElementById("ratingStar1").src="images/filledStar.png";
            document.getElementById("ratingStar2").src="images/filledStar.png";
            document.getElementById("ratingStar3").src="images/filledStar.png";
            break;
        case 4:
            document.getElementById("ratingStar1").src="images/filledStar.png";
            document.getElementById("ratingStar2").src="images/filledStar.png";
            document.getElementById("ratingStar3").src="images/filledStar.png";
            document.getElementById("ratingStar4").src="images/filledStar.png";
            break;
        default:
            document.getElementById("ratingStar1").src="images/filledStar.png";
            document.getElementById("ratingStar2").src="images/filledStar.png";
            document.getElementById("ratingStar3").src="images/filledStar.png";
            document.getElementById("ratingStar4").src="images/filledStar.png";
            document.getElementById("ratingStar5").src="images/filledStar.png";
}
}

function unhoverReview(value){
    switch (value){
        case 1:
            document.getElementById("ratingStar1").src="images/emptyStar.png";
            break;
        case 2:
            document.getElementById("ratingStar1").src="images/emptyStar.png";
            document.getElementById("ratingStar2").src="images/emptyStar.png";
            break;
        case 3:
            document.getElementById("ratingStar1").src="images/emptyStar.png";
            document.getElementById("ratingStar2").src="images/emptyStar.png";
            document.getElementById("ratingStar3").src="images/emptyStar.png";
            break;
        case 4:
            document.getElementById("ratingStar1").src="images/emptyStar.png";
            document.getElementById("ratingStar2").src="images/emptyStar.png";
            document.getElementById("ratingStar3").src="images/emptyStar.png";
            document.getElementById("ratingStar4").src="images/emptyStar.png";
            break;
        default:
            document.getElementById("ratingStar1").src="images/emptyStar.png";
            document.getElementById("ratingStar2").src="images/emptyStar.png";
            document.getElementById("ratingStar3").src="images/emptyStar.png";
            document.getElementById("ratingStar4").src="images/emptyStar.png";
            document.getElementById("ratingStar5").src="images/emptyStar.png";
}
}

$(document).ready(function(){
    $(".ratingStars").children("#ratingStar").click(function(){	
	alert($(this).attr("value") + "Stars!");
	});
});

$(document).ready(function(){
    $(".ratingStars").children("#ratingStar").mouseenter(function(){	
	$( "div" ).each(function( i ) {
	});
})
});
