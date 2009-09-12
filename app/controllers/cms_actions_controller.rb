class CmsActionsController < ApplicationController
    def index
        @cms_actions = CmsAction.all_ordered_by_cms_controller()
    end

    def show
        @cms_action = CmsAction.find(params[:id])
    end

    def new
        @cms_action = CmsAction.create
        redirect_to(edit_cms_action_path(@cms_action))
    end

    def edit
        @cms_action = CmsAction.find(params[:id])
        render "cms_actions/edit/" + @cms_action.current_state_template()
    end

    def update(direction = params[:direction])
        @cms_action = CmsAction.find_by_id(params[:id])
        case direction
            when "previous"
                @cms_action.apply_event(direction)
            when "next"
                if params[:cms_action][:label].blank?
                    params[:cms_action][:label] = params[:cms_action][:name]
                end
                @cms_action.update_attributes(params[:cms_action])
                @cms_action.apply_event(direction)
                if @cms_action.current_state == :COMPLETED
                    flash[:notice] = "CmsAction completed!"
                    redirect_to(cms_actions_path()) 
                    return
                end
            when "change_cms_controller"
                @cms_action.name = nil
                @cms_action.label = nil
                @cms_action.update_attributes(params[:cms_action])
                @cms_action.apply_event(direction)
            when "change_cms_action"
                if params[:cms_action][:label].blank?
                    params[:cms_action][:label] = params[:cms_action][:name]
                end
                @cms_action.update_attributes(params[:cms_action])
                @cms_action.apply_event(direction)
                flash[:notice] = "CmsAction updated!"
                redirect_to(cms_actions_path()) 
                return
        end
        redirect_to(edit_cms_action_path(@cms_action))
    end

    def destroy
        @cms_action = CmsAction.find(params[:id])
        @cms_action.destroy
        redirect_to(cms_actions_url)
    end
end
