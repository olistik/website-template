function add_nested_item(element) {
    var template_var_name = element.attr("href").replace(/.*#/, '');
    var template = eval(template_var_name);
    template = replace_ids(template);
    var container_id = "#" + element.attr("rel");
    jQuery(container_id).append(template);
}

function remove_nested_item(element) {
    element.parents(element.attr('href')).html("");
}

function bind_add_nested_object() {
    jQuery('.add.nested_object').click(function() {
        add_nested_item(jQuery(this));
        bind_remove_nested_object();
        return false;
    });
}

function bind_remove_nested_object() {
    jQuery('.remove.nested_object').unbind("click").click(function() {
        remove_nested_item(jQuery(this));
        return false;
    });
}

jQuery(document).ready(function() {
    bind_add_nested_object();
    bind_remove_nested_object();
});

