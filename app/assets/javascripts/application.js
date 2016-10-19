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
//= require calendar

// Check if a elem block is in the viewport
function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();
    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return (elemTop < docViewBottom);
}

// function to toggle preview image on title image select
function preview_toggle_for_title_image(){
    $('.gallery-image-select .cs-options').find('li').click(function () {
        var aa=$('.gallery-image-select').find('span.cs-placeholder').text();
        var x=aa.search('--');
        if(x<0){
            var id=$('.gallery-image-select select').val();
            var src=$('.preload-image span#'+id).html();
            $('.preview-image img').attr('src', src).css("visibility","visible");
        }
        else {
            $('.preview-image img').css("visibility", "hidden");
        }
    });
}

function toggle_fields_on_select(field) {

    var control_field='.'+field;
    var classname='-'+field;

    // LOAD VISIBLE CONTENT BASED ON CONTROL FIELD
    $('.all'+classname).hide();
    $('.'+$(control_field).find('span.cs-placeholder').text()+classname).show();

    // TOGGLE VISIBLE CONTENT BASED ON ARTICLE TYPE CHANGE
    $(control_field + ' .cs-options').find('li').click(function () {
        var aa=$('.all'+classname);
        aa.hide();
        var cc= $(this).attr('data-value');
        var bb=$('.' + cc + classname);
        bb.show();
    });
}

$(document).ready(function() {

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
    $(".text-field input, .text-field textarea").focus(function() {
        $elem=$(this);
        $elem.parent().addClass("has_focus");
        check_has_value($elem); // check values are reseted
    }).blur(function(){
        $elem=$(this);
        $elem.parent().removeClass("has_focus");
        check_has_value($elem); // check values are reseted
    });

    $(".text-field input[type=text], .text-field textarea").each(function() {

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

    toggle_fields_on_select('article-type');
    toggle_fields_on_select('asset-type');
    toggle_fields_on_select('image');

    preview_toggle_for_title_image();

});
