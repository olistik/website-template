jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery(document).ajaxSend(function(event, request, settings) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

replace_ids = function(s){
  var new_id = get_random_id();
  return replace_id(s, new_id);
}

function get_random_id() {
    return new Date().getTime();
}

function replace_id(s, new_id) {
    return s.replace(/NEW_RECORD/g, new_id);
}
