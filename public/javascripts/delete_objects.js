jQuery(document).ready(function() {
    bind_delete_object();
});

function bind_delete_object() {
    jQuery('.delete.object').click(function() {
        delete_object(jQuery(this));
        return false;
    });
}

function delete_object(link) {
    var object_id = link.attr("rel");
    var father_id = link.siblings('input[name=father_id]').val();
    var father_class = link.siblings('input[name=father_class]').val();
    var url = link.attr("href");
    var data = {object_id : object_id, father_id : father_id};
    jQuery.post(url, data, function() {
        link.parent('.' + father_class).empty();
    });
}

