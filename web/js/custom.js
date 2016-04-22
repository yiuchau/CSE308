/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function submitRating(){
    $(".ratingStars").children("#ratingStar").click(function(){
        $(".ratingStars").children().off("mouseover mouseleave");
	alert($(this).attr("value") + " Stars!");
	});
});

$(document).ready(function showStars(){
    $(".ratingStars").children("#ratingStar").on("mouseover", function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png");
        }

	});
});

$(document).ready(function removeStars() {
    $(".ratingStars").children("#ratingStar").on("mouseleave", function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/emptyStar.png");
        }
	});
});

$(document).ready(function editRating(){
    $(".editRating").click(function(){
        $(".ratingStars").children().on("mouseover mouseleave");
        $(".ratingStars").children("#ratingStar").attr("src","images/emptyStar.png");
	});
});

$(document).ready(function removeRating(){
    $(".removeRating").click(function(){
        $(".ratingStars").children("#ratingStar").attr("src","images/emptyStar.png");
	});
});