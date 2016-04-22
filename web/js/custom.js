/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $(".ratingStars").children("#ratingStar").click(function(){	
	alert($(this).attr("value") + " Stars!");
	});
});

$(document).ready(function(){
    $(".ratingStars").children("#ratingStar").mouseover(function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/filledStar.png")
        }

	});
});

$(document).ready(function(){
    $(".ratingStars").children("#ratingStar").mouseleave(function(){
        var starAmount = $(this).attr("value");
        starAmount++;
        for (var i = 1; i <starAmount; i++){
            $(".ratingStars :nth-child(" + i + ")").attr("src","images/emptyStar.png");
        }
	});
});
