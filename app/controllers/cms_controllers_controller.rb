class CmsControllersController < ApplicationController
    def index
        @cms_controllers = CmsController.all
        @number_of_cms_controllers_left = CmsController.cms_controllers_left.size
    end

    def show
        @cms_controller = CmsController.find(params[:id])
    end

    def new
        @cms_controller = CmsController.new
        @cms_controllers_left = CmsController.cms_controllers_left
    end

    def create
        @cms_controller = CmsController.new(params[:cms_controller])
        if @cms_controller.save
            flash[:notice] = 'CmsController was successfully created.'
            redirect_to(cms_controllers_path)
        else
            render :action => "new"
        end
    end

    def create_remaining
        @number_of_cms_controllers_created = CmsController.create_remaining
        flash[:notice] = "Creati #{@number_of_cms_controllers_created} Controllori"
        redirect_to(cms_controllers_path)
    end

    def update
        @cms_controller = CmsController.find(params[:id])
        if @cms_controller.update_attributes(params[:cms_controller])
            flash[:notice] = 'CmsController was successfully updated.'
            redirect_to(@cms_controller)
        else
            render :action => "edit"
        end
    end

    def destroy
        @cms_controller = CmsController.find(params[:id])
        @cms_controller.destroy
        flash[:notice] = "Il controllore con id = #{params[:id]} è stato cancellato"
        redirect_to(cms_controllers_url)
    end
end
