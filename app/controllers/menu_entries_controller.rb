class MenuEntriesController < ApplicationController
    def index
        @menu_entries = MenuEntry.all_ordered_by_cms_controller_and_cms_action
    end

    def show
        @menu_entry = MenuEntry.find(params[:id])
    end

    def new
        @menu_entry = MenuEntry.new
        @cms_actions = CmsAction.all_for_select
        @menu_entries = MenuEntry.all_for_select
    end

    def edit
        @menu_entry = MenuEntry.find(params[:id])
        @cms_actions = CmsAction.all_for_select
        @menu_entries = MenuEntry.all_for_select
    end

    def create
        @menu_entry = MenuEntry.new(params[:menu_entry])
        if @menu_entry.save
            flash[:notice] = 'MenuEntry was successfully created.'
            redirect_to(menu_entries_path)
        else
            render :action => "new"
        end
    end

    def update
        @menu_entry = MenuEntry.find(params[:id])
        if @menu_entry.update_attributes(params[:menu_entry])
            flash[:notice] = 'MenuEntry was successfully updated.'
            redirect_to(menu_entries_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @menu_entry = MenuEntry.find(params[:id])
        @menu_entry.destroy
        redirect_to(menu_entries_url)
    end
end
