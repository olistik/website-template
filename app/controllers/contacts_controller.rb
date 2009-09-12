class ContactsController < ApplicationController
    def index
        @contacts = Contact.all
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def new
        @contact = Contact.new
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def create
        @contact = Contact.new(params[:contact])
        if @contact.save
            flash[:notice] = 'Contact was successfully created.'
            redirect_to(contacts_path)
        else
            render :action => "new"
        end
    end

    def update
        @contact = Contact.find(params[:id])
        if @contact.update_attributes(params[:contact])
            flash[:notice] = 'Contact was successfully updated.'
            redirect_to(contacts_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
        redirect_to(contacts_path)
    end
end
