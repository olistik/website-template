class RegionsController < ApplicationController
    def index
        @regions = Region.all
    end

    def show
        @region = Region.find(params[:id])
    end

    def new
        @region = Region.new
        @nations = Nation.all_for_select
    end

    def edit
        @region = Region.find(params[:id])
        @nations = Nation.all_for_select
    end

    def create
        @region = Region.new(params[:region])
        if @region.save
            flash[:notice] = '<i>Regione creata con successo.'
            redirect_to(regions_path)
        else
            render :action => "new"
        end
    end

    def update
        @region = Region.find(params[:id])
        if @region.update_attributes(params[:region])
            flash[:notice] = '<i>Regione aggiornata con successo.'
            redirect_to(regions_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @region = Region.find(params[:id])
        @region.destroy
        redirect_to(regions_path)
    end

    def get_all_by_nation_id(nation_id = params[:nation_id])
        render :json => Region.find_all_by_nation_id(nation_id)
    end
end
