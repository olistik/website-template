class MacroCategoriesController < ApplicationController
    def index
        @macro_categories = MacroCategory.all
    end

    def show
        @macro_category = MacroCategory.find(params[:id])
    end

    def new
        @macro_category = MacroCategory.new
        @categories = Category.all
    end

    def edit
        @macro_category = MacroCategory.find(params[:id])
        @categories = Category.all
    end

    def create
        @macro_category = MacroCategory.new(params[:macro_category])
        if @macro_category.save
            flash[:notice] = 'MacroCategory was successfully created.'
            redirect_to(macro_categories_path)
        else
            render :action => "new"
        end
    end

    def update
        params[:macro_category][:category_ids] ||= []
        @macro_category = MacroCategory.find(params[:id])
        if @macro_category.update_attributes(params[:macro_category])
            flash[:notice] = 'MacroCategory was successfully updated.'
            redirect_to(macro_categories_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @macro_category = MacroCategory.find(params[:id])
        @macro_category.destroy
        redirect_to(macro_categories_path)
    end
end
