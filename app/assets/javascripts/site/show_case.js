$(document).ready(function() {

    // Initialize Masonry
    $('#content').masonry({
        columnWidth: 280,
        itemSelector: '.item',
        isFitWidth: true,
        isAnimated: !Modernizr.csstransitions
    }).imagesLoaded(function() {
        $(this).masonry('reload');
    });

    // Add anchor attributes from img tag
    $('.item').each(function(){
        var $a=$(this).find('a');
        var $img=$(this).find('img');
        var $span=$(this).find('span');
        $a.attr('href', $img.attr('src'))
            .attr('data-fresco-caption', $span.html())
            .addClass("fresco");
    });
});