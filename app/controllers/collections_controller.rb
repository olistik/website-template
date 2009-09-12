class CollectionsController < ApplicationController
    def index
        @collections = Collection.all
    end

    def show
        @collection = Collection.find(params[:id])
    end

    def new
        @collection = Collection.new
        @advertisements = Advertisement.all
        @categories = Category.all_for_select
    end

    def edit
        @collection = Collection.find(params[:id])
        @advertisements = Advertisement.all
        @categories = Category.all_for_select
    end

    def create
        @collection = Collection.new(params[:collection])
        if @collection.save
            flash[:notice] = 'Collection was successfully created.'
            redirect_to(collections_path)
        else
            render :action => "new"
        end
    end

    def update
        params[:collection][:advertisement_ids] ||= []
        @collection = Collection.find(params[:id])
        if @collection.update_attributes(params[:collection])
            flash[:notice] = 'Collection was successfully updated.'
            redirect_to(collections_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @collection = Collection.find(params[:id])
        @collection.destroy
        redirect_to(collections_url)
    end
end
