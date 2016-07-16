// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= //require turbolinks
//= require_tree .


// Set Home Page banner height and width
function SetHomePage(){
    $('.banner').css(({height:$(window).height()}));
}

$(window).resize(function(){ SetHomePage(); });
$(window).load(function(){ SetHomePage(); });

function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return (elemTop < docViewBottom);
}


$(window).scroll(function(){
    $elem=$('.footer-content');
    if ($elem){
        if (isScrolledIntoView($elem)) {
            $('.floater').addClass('override-floater');
        }
        else{
            $('.floater').removeClass('override-floater');
        }
    }
});

// ANCHOR TITLE CONVERTION INTO SPAN TAG
$(document).ready(function(){
    $("a").each(function(obj) {
        $elem=$(this);
        if ($elem.attr("title") != undefined){
            $elem.append("<span>"+$elem.attr("title")+"</span>");
            $elem.addClass('tip');
        }
    });
});
