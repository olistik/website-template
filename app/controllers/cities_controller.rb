class CitiesController < ApplicationController
    def index
        @cities = City.all
    end

    def show
        @city = City.find(params[:id])
    end

    def new
        @city = City.new
        @provinces = Province.all_for_select
    end

    def edit
        @city = City.find(params[:id])
        @provinces = Province.all_for_select
    end

    def create
        @city = City.new(params[:city])
        if @city.save
            flash[:notice] = 'City was successfully created.'
            redirect_to(cities_path)
        else
            render :action => "new"
        end
    end

    def update
        @city = City.find(params[:id])
        if @city.update_attributes(params[:city])
            flash[:notice] = 'City was successfully updated.'
            redirect_to(cities_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @city = City.find(params[:id])
        @city.destroy
        redirect_to(cities_url)
    end

    def get_all_by_province_id(province_id = params[:province_id])
        render :json => City.find_all_by_province_id(province_id)
    end
end
