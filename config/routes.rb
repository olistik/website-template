ActionController::Routing::Routes.draw do |map|
    map.resource(:user_session)
    map.resource(:account, :controller => "users")
    map.resources(:users)
    map.resources(:authorizations)

    map.resources :menu_entries, :roles, :actions, :controllers,
        :advertisement_notes, :advertisements, :customers, :contacts,
        :contact_types, :categories, :macro_categories,
        :services, :nations, :regions, :provinces, :cities,
        :slug_navigators, :cms_actions, :advertisement_levels,
        :collections, :contact_details, :cell_containers, :cell_actions,
        :cell_layouts, :seo_patterns,
        :path_prefix => "cms"
    map.resources :cms_controllers,
        :new => {:create_remaining => :get},
        :path_prefix => "cms"
    map.resources :photos, :has_many => :collections, :path_prefix => "cms"
    map.resources :pubblications, :has_many => :collections, :path_prefix => "cms"
    map.resources :composition_rules, :path_prefix => "cms", :collection => {:search => :post}
    map.resources :slugs, :path_prefix => "cms", :member => {:apply_pattern => :post}
    
    map.get_all_regions_by_nation_id 'get_all_regions_by_nation_id', :controller => 'regions', :action => 'get_all_by_nation_id'
    map.get_all_provinces_by_region_id 'get_all_provinces_by_region_id', :controller => 'provinces', :action => 'get_all_by_region_id'
    map.get_all_cities_by_province_id 'get_all_cities_by_province_id', :controller => 'cities', :action => 'get_all_by_province_id'
    
    map.load_cell 'load_cell', :controller => 'cells', :action => 'ajax_load'

    map.update_cell_actions 'update_cell_actions', :controller => 'cell_actions', :action => 'update_cell_actions'
    map.seo_table_attributes 'seo_table_attributes', :controller => 'seo_patterns', :action => 'table_attributes'
    map.seo_objects_by_type 'seo_objects_by_type', :controller => 'slugs', :action => 'seo_objects_by_type'

    map.login('login', :controller => 'user_sessions', :action => 'new')
    map.logout('logout', :controller => 'user_sessions', :action => 'destroy')

    map.connect(':slug.html', :controller => "slugs", :action => "drive")
    map.connect(':slug', :controller => "slugs", :action => "not_found")

    # this one is needed by rails apotomo's #address_to_event
    map.connect '/cell_actions/:action/:id', :controller => 'cell_actions'
    map.connect '/:controller/:action/:id'
    map.connect '/:controller/:action/:id.:format'
  
    map.root(:controller => "slugs", :action => "default")
end

