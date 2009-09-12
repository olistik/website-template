var csssubmenuoffset=-1 //Offset of submenus from main menu. Default is 0 pixels.

function set_nested_list(ul) {
        var left_offset;
        var top_offset;
        if (ul.parent().parent().parent().hasClass('horizontalcssmenu')) {
            top_offset = ul.parent().height() - 1;         
            left_offset = 0;
        } else {
            top_offset = 1;
            left_offset = ul.parent().width() - 20;
        }
        ul.css("top", top_offset);
        ul.css("left", left_offset);
        var spanref = jQuery("<span />");
        spanref.addClass("arrowdiv");
        spanref.html("&nbsp;&nbsp;&nbsp;&nbsp;");
        ul.parent().find('a').eq(0).append(spanref);
        ul.parent().mouseover(function() {
            
            jQuery(this).css("zIndex", 100);
            jQuery(this).find('ul').eq(0).css('visibility', 'visible');
            jQuery(this).find('ul').eq(0).css('zIndex', '0');
        }).mouseout(function() {
            jQuery(this).css("zIndex", 0);
            jQuery(this).find('ul').eq(0).css('visibility', 'hidden');
            jQuery(this).find('ul').eq(0).css('zIndex', '100');
        });
}

function create_css_menu(menu) {
    menu.find('ul').each(function() {
        set_nested_list(jQuery(this));
    });
}

function create_css_menus() {
    jQuery('.horizontalcssmenu > ul').each(function() {
        create_css_menu(jQuery(this));
    })
}

jQuery(document).ready(function() {
    create_css_menus();
});

