class ServicesController < ApplicationController
    def index
        @services = Service.all
    end

    def show
        @service = Service.find(params[:id])
    end

    def new
        @service = Service.new
    end

    def edit
        @service = Service.find(params[:id])
        @categories = Category.all
        @advertisements = Advertisement.all
    end

    def create
        @service = Service.new(params[:service])
        if @service.save
            flash[:notice] = '<i>Servizio</i> creato con successo.'
            redirect_to(services_path)
        else
            render :action => "new"
        end
    end

    def update
        params[:service][:category_ids] ||= []
        params[:service][:advertisement_ids] ||= []
        @service = Service.find(params[:id])
        if @service.update_attributes(params[:service])
            flash[:notice] = '<i>Servizio</i> aggiornato con successo.'
            redirect_to(services_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @service = Service.find(params[:id])
        @service.destroy
        redirect_to(services_path)
    end
end
