jQuery(document).ready(function() {
    jQuery('#nation_id').change(function() {
        var nation_id = jQuery(this).val();
        if (nation_id == "") {
            jQuery('#region_id').html("");
            jQuery('#province_id').html("");
            jQuery('.city_id').html("");
            return;
        }
        var url = jQuery(this).data("action_url");
        var data = {nation_id : nation_id};
        jQuery.post(url, data, function(data) {
            jQuery('#region_id').html("");
            jQuery('#province_id').html("");
            jQuery('.city_id').html("");
            jQuery('#region_id').append("<option value=''></option>");
            for (var i = 0; i < data.length; ++i) {
                var region = data[i].region;
                jQuery('#region_id').append("<option value='" + region.id + "'>" + region.name + "</option>");
            }
        }, "json");
    });

    jQuery('#region_id').change(function() {
        var region_id = jQuery(this).val();
        var url = jQuery(this).data("action_url");
        var data = {region_id : region_id};
        jQuery.post(url, data, function(data) {
            jQuery('#province_id').html("");
            jQuery('.city_id').html("");
            jQuery('#province_id').append("<option value=''></option>");
            for (var i = 0; i < data.length; ++i) {
                var province = data[i].province;
                jQuery('#province_id').append("<option value='" + province.id + "'>" + province.name + "</option>");
            }
        }, "json");
    });

    jQuery('#province_id').change(function() {
        var province_id = jQuery(this).val();
        var url = jQuery(this).data("action_url");
        var data = {province_id : province_id};
        jQuery.post(url, data, function(data) {
            jQuery('.city_id').html("");
            jQuery('.city_id').append("<option value=''></option>");
            for (var i = 0; i < data.length; ++i) {
                var city = data[i].city;
                jQuery('.city_id').append("<option value='" + city.id + "'>" + city.name + "</option>");
            }
        }, "json");
    });

});
