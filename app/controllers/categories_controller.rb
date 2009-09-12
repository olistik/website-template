class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
        @services = Service.all
        @macro_categories = MacroCategory.all_for_select
    end

    def edit
        @category = Category.find(params[:id])
        @macro_categories = MacroCategory.all_for_select
        @services = Service.all
    end

    def create
        @category = Category.new(params[:category])
        if @category.save
            flash[:notice] = 'Category was successfully created.'
            redirect_to(categories_path)
        else
            render :action => "new"
        end
    end

    def update
        params[:category][:service_ids] ||= []
        @category = Category.find(params[:id])
        if @category.update_attributes(params[:category])
            flash[:notice] = 'Category was successfully updated.'
            redirect_to(categories_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to(categories_url)
    end
end
