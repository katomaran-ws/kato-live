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

//= require_tree .
//= require tinymce


// Set Home Page banner height and width
function SetHomePage(){
    $('.banner').css(({height:$(window).height()}));
}

// Set Home Page banner height and width
function SetAdminPage(){
    $('.banner').css(({height:$(window).height()/2}));
}

// Make Text Area Height dynamic based on the content size
function text_area(elem) {
    $(elem).css({'height':'auto','overflow-y':'hidden'}).height(elem.scrollHeight-13);
}

// FUNCTION TO CHECK HAS VALUE FOR TEXT FIELDS
function check_has_value(elem){
    $elem=elem;
    if($elem.val()!=''){
        $elem.parent().addClass("has_value");
    }
    else{
        $elem.parent().removeClass("has_value");
    }
}

// Check if a elem block is in the viewport
function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return (elemTop < docViewBottom);
}


function toggle_fields_on_select(control_field) {

    // TOGGLE VISIBLE CONTENT BASED ON ARTICLE TYPE CHANGE
    $('.' + (control_field) + ' .cs-options').find('li').click(function () {
        $('.all-article-type').hide();
        console.log(this);
        $('.' + $(this).attr('data-value') + "-article-type").show();
    });
}

function select_defaults_toggle_fields(control_field) {

    // LOAD VISIBLE CONTENT BASED ON CONTROL FIELD
    $('.all-'+control_field).hide();
    $('.'+$('.'+control_field).find('span.cs-placeholder').text()+"-"+control_field).show();
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

$(document).ready(function(){

    // ANCHOR TITLE CONVERTION INTO SPAN TAG
    $("a").each(function(obj) {
        $elem=$(this);
        if ($elem.attr("title") != undefined){
            $elem.append("<span>"+$elem.attr("title")+"</span>");
            $elem.addClass('tip');
            $elem.attr('title','');
        }
    });

    // FOCUS CLASS TOGGLE FOR TEXT FIELDS
    $(".text-field input, .text-field textarea").focus(function(){
        $elem=$(this);
        $elem.parent().addClass("has_focus");
        check_has_value($elem); // check values are reseted
    }).blur(function(){
        $elem=$(this);
        $elem.parent().removeClass("has_focus");
        check_has_value($elem); // check values are reseted
    });

    $(".text-field input[type=text], .text-field textarea").each(function(){

        //INSERTING 2 SPAN TAG BEFORE TEXT FIELD TAG AND TEXT AREA TAG
        var val=$(this).attr('placeholder');
        $( "<span>"+val+"</span>" ).insertBefore( $(this) );
        $( "<span>"+val+"</span>" ).insertBefore( $(this) );
        $(this).attr('placeholder', '');

        // HAS VALUE CLASS TOGGLE FOR TEXT FIELDS ON LOAD
        check_has_value($(this));
    });


    // FUNCTION TO ENABLE CLICK ON THE SPAN TAG
    $('.text-field').on("click", function(){
        ($(this).find("input[type=text], textarea").focus());
    });


    // CHANGE TEXT AREA BLOCK HEIGHT BASED ON THE CONTENT SIZE
    $('textarea').each(function () {
        text_area(this);
    }).on('input', function () {
        text_area(this);
    });


    toggle_fields_on_select('article_type');

});
