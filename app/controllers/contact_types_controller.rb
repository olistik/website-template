class ContactTypesController < ApplicationController
    def index
        @contact_types = ContactType.all
    end

    def show
        @contact_type = ContactType.find(params[:id])
    end

    def new
        @contact_type = ContactType.new
    end

    def edit
        @contact_type = ContactType.find(params[:id])
    end

    def create
        @contact_type = ContactType.new(params[:contact_type])
        if @contact_type.save
            flash[:notice] = 'ContactType was successfully created.'
            redirect_to(contact_types_path)
        else
            render :action => "new"
        end
    end

    def update
        @contact_type = ContactType.find(params[:id])
        if @contact_type.update_attributes(params[:contact_type])
            flash[:notice] = 'ContactType was successfully updated.'
            redirect_to(contact_types_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @contact_type = ContactType.find(params[:id])
        @contact_type.destroy
        redirect_to(contact_types_path)
    end
end
