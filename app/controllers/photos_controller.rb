class PhotosController < ApplicationController
    def index
        @photos = Photo.all
    end

    def show
        @photo = Photo.find(params[:id])
    end

    def new
        @photo = Photo.new
        @advertisements = Advertisement.all
        @customers = Customer.all_for_select
    end

    def edit
        @photo = Photo.find(params[:id])
        @advertisements = Advertisement.all
        @customers = Customer.all_for_select
    end

    def create
        @photo = Photo.new(params[:photo])
        if @photo.save
            flash[:notice] = 'Photo was successfully created.'
            redirect_to(photos_path)
        else
            render :action => "new"
        end
    end

    def update
        params[:photo][:advertisement_ids] ||= []
        @photo = Photo.find(params[:id])
        if @photo.update_attributes(params[:photo])
            flash[:notice] = 'Photo was successfully updated.'
            redirect_to(photos_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
        redirect_to(photos_path)
    end
end
