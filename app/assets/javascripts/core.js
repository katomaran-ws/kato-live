//= require jquery
//= require bootstrap

// Set Home Page banner height and width
function SetFullPageBanner() {
    $('.banner').css(({height:$(window).height()}));
}

// Set Home Page banner height and width
function SetHalfPageBanner() {
    $('.banner').css(({height:$(window).height()/2}));
}

// Show Pop up once page loaded.
$(function(){
    function show_popup(){
        $(".pop_up_button").trigger( "click")
    }
    $(document).ready(function() {
        window.setTimeout(show_popup, 10000);
    });
});