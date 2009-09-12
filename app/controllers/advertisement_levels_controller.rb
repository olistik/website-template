class AdvertisementLevelsController < ApplicationController
    def index
        @advertisement_levels = AdvertisementLevel.all
    end

    def show
        @advertisement_level = AdvertisementLevel.find(params[:id])
    end

    def new
        @advertisement_level = AdvertisementLevel.new
    end

    def edit
        @advertisement_level = AdvertisementLevel.find(params[:id])
    end

    def create
        @advertisement_level = AdvertisementLevel.new(params[:advertisement_level])
        if @advertisement_level.save
            flash[:notice] = 'AdvertisementLevel was successfully created.'
            redirect_to(advertisement_levels_path)
        else
            render :action => "new"
        end
    end

    def update
        @advertisement_level = AdvertisementLevel.find(params[:id])
        if @advertisement_level.update_attributes(params[:advertisement_level])
            flash[:notice] = 'AdvertisementLevel was successfully updated.'
            redirect_to(advertisement_levels_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @advertisement_level = AdvertisementLevel.find(params[:id])
        @advertisement_level.destroy
        redirect_to(advertisement_levels_url)
    end
end
