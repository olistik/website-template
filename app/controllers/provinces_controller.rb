class ProvincesController < ApplicationController
    def index
        @provinces = Province.all
    end

    def show
        @province = Province.find(params[:id])
    end

    def new
        @province = Province.new
        @regions = Region.all_for_select
    end

    def edit
        @province = Province.find(params[:id])
        @regions = Region.all_for_select
    end

    def create
        @province = Province.new(params[:province])
        if @province.save
            flash[:notice] = 'Province was successfully created.'
            redirect_to(provinces_path)
        else
            render :action => "new"
        end
    end

    def update
        @province = Province.find(params[:id])
        if @province.update_attributes(params[:province])
            flash[:notice] = 'Province was successfully updated.'
            redirect_to(provinces_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @province = Province.find(params[:id])
        @province.destroy
        redirect_to(provinces_path)
    end

    def get_all_by_region_id(region_id = params[:region_id])
        render :json => Province.find_all_by_region_id(region_id)
    end
end
