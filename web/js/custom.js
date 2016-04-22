/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function sendReview(value) {
    window.alert(value + " STARS!!");
}

function hoverReview(value){
    var stars = document.getElementById('ratingStar');
    for(i = 0; i < value; i ++){
    var individualStar = stars.childNodes[i];
    individualStar.innerHTML = "TEST";
}
}