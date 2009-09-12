class ContactDetailsController < ApplicationController
    def index
        @contact_details = ContactDetail.all
    end

    def show
        @contact_detail = ContactDetail.find(params[:id])
    end

    def new
        @contact_detail = ContactDetail.new
        @contacts = Contact.all_for_select
        @contact_types = ContactType.all_for_select
    end

    def edit
        @contact_detail = ContactDetail.find(params[:id])
        @contacts = Contact.all_for_select
        @contact_types = ContactType.all_for_select
    end

    def create
        @contact_detail = ContactDetail.new(params[:contact_detail])
        if @contact_detail.save
            flash[:notice] = 'ContactDetail was successfully created.'
            redirect_to(contact_details_path)
        else
            render :action => "new"
        end
    end

    def update
        @contact_detail = ContactDetail.find(params[:id])
        if @contact_detail.update_attributes(params[:contact_detail])
            flash[:notice] = 'ContactDetail was successfully updated.'
            redirect_to(contact_details_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @contact_detail = ContactDetail.find(params[:id])
        @contact_detail.destroy
        redirect_to(contact_details_url)
    end
end
