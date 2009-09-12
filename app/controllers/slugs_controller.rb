class SlugsController < ResourceController::Base
    include Cell::ActionView
    #    before_filter :require_user, :authorize, :only => [:drive]

    [create, update, destroy].each do |action|
        action.wants.html { redirect_to collection_path }
    end

    new_action.before do
        get_collections
    end

    edit.before do
        get_collections
    end

    def get_collections
        @seo_patterns = SeoPattern.all_for_select
        @seo_object_types = SeoPattern.all_object_types
    end

    def default()
    end

    def drive(slug_name = params[:slug])
        @slug = Slug.find_by_name(slug_name + ".html")
        unless @slug
            not_found()
        end
    end

    def not_found()
    end

    def seo_objects_by_type
        options = {:seo_object_type => params[:seo_object_type]}
        render :inline => render_cell(:slug, :seo_objects_by_type, options)
    end

    def apply_pattern
        @slug = Slug.find(params[:id])
        if @slug.apply_pattern
            flash[:notice] = "Pattern applied for slug with id = #{@slug.id}"
        else
            flash[:notice] = "Errors when applying pattern to slug with id = #{@slug.id}"
        end
        redirect_to collection_path
    end
end
