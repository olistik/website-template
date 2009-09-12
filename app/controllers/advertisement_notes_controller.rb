class AdvertisementNotesController < ApplicationController
    def index
        @advertisement_notes = AdvertisementNote.all
    end

    def show
        @advertisement_note = AdvertisementNote.find(params[:id])
    end

    def new
        @advertisement_note = AdvertisementNote.new
        @advertisements = Advertisement.all_for_select
    end

    def edit
        @advertisement_note = AdvertisementNote.find(params[:id])
    end

    def create
        @advertisement_note = AdvertisementNote.new(params[:advertisement_note])
        if @advertisement_note.save
            flash[:notice] = 'AdvertisementNote was successfully created.'
            redirect_to(advertisement_notes_path)
        else
            render :action => "new"
        end
    end

    def update
        @advertisement_note = AdvertisementNote.find(params[:id])
        if @advertisement_note.update_attributes(params[:advertisement_note])
            flash[:notice] = 'AdvertisementNote was successfully updated.'
            redirect_to(advertisement_notes_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @advertisement_note = AdvertisementNote.find(params[:id])
        @advertisement_note.destroy
        redirect_to(advertisement_notes_url)
    end
end
