class AdvertisementsController < ApplicationController
    def index
        @advertisements = Advertisement.all
    end

    def show
        @advertisement = Advertisement.find(params[:id])
    end

    def new
        @advertisement = Advertisement.new
        @nations = Nation.all_for_select
        @customers = Customer.all_for_select
        @contacts = Contact.all_for_select
        @advertisement.notes.build
        @services = Service.all
        @advertisement_levels = AdvertisementLevel.all_for_select
        @collections = Collection.all
        @categories = Category.all
    end

    def edit
        @advertisement = Advertisement.find(params[:id])
        @nations = Nation.all_for_select
        @regions = Region.all_by_nation_id_for_select @advertisement.city.province.region.nation
        @provinces = Province.all_by_region_id_for_select @advertisement.city.province.region
        @cities = City.all_by_province_id_for_select @advertisement.city.province
        @customers = Customer.all_for_select
        @contacts = Contact.all_for_select
        @services = Service.all
        @advertisement_levels = AdvertisementLevel.all_for_select
        @collections = Collection.all
        @categories = Category.all
    end

    def create
        @advertisement = Advertisement.new(params[:advertisement])
        if @advertisement.save
            flash[:notice] = 'Advertisement was successfully created.'
            redirect_to(advertisements_path)
        else
            render :action => "new"
        end
    end

    def update
        @advertisement = Advertisement.find(params[:id])
        params[:advertisement][:service_ids] ||= []
        params[:advertisement][:collection_ids] ||= []
        params[:advertisement][:category_ids] ||= []
        if @advertisement.update_attributes(params[:advertisement])
            flash[:notice] = 'Advertisement was successfully updated.'
            redirect_to(advertisements_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @advertisement = Advertisement.find(params[:id])
        @advertisement.destroy
        redirect_to(advertisements_url)
    end
end
