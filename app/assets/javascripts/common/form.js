// Make Text Area Height dynamic based on the content size
function text_area(elem) {
    $(elem).css({'height':'auto','overflow-y':'hidden'}).height(elem.scrollHeight+13);
}

// FUNCTION TO CHECK HAS VALUE FOR TEXT FIELDS
function check_has_value(elem) {
    $elem=elem;
    if($elem.val()!=''){
        $elem.parent().addClass("has_value");
    }
    else{
        $elem.parent().removeClass("has_value");
    }
}