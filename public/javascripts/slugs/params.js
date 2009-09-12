jQuery(document).ready(function() {
    function add_slug_parameter() {
        var tr = jQuery("<tr />");
        var td = jQuery("<td />");
        var new_id = get_random_id();
        td.html(replace_id(slug_param_name, new_id));
        tr.append(td);
        td = jQuery("<td />");
        td.html(replace_id(slug_param_value, new_id));
        tr.append(td);
        td = jQuery("<td />");
        td.html(remove_link);
        tr.append(td);
        jQuery('.slug_data tbody').append(tr);
        var link = jQuery('.slug_data tbody tr:last .remove.slug_parameter');
        bind_remove_link(link);
    }

    function remove_slug_parameter(link) {
        link.parents("tr").remove();
    }

    function bind_remove_link(link) {
        link.click(function() {
            remove_slug_parameter(jQuery(this));
            return false;
        });    
    }

    function bind_remove_links() {
        jQuery('.remove.slug_parameter').each(function() {
            bind_remove_link(jQuery(this));
        });
    }

    jQuery('.add.slug_parameter').click(function() {
        add_slug_parameter();
        return false;
    });

    bind_remove_links();
});

