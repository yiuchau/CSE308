/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function editAccount(){
    $(".editAccount").click(function(){
        alert("Click OK to edit your account");
        window.location = "./editAccount.jsp";
    });
});

$(document).ready(function deleteAccount(){
    $(".deleteAccount").click(function(){
        alert("Click OK to delete your account");
        window.location = "http://localhost:8080/308code/DeleteAccountServlet";
    });
});

$(document).ready(function linkAccount(){
    $(".linkAccount").click(function(){
        alert("Click OK to link your account. Build later");
    });
});
            
            
