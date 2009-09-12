class NationsController < ApplicationController
    def index
        @nations = Nation.all
    end

    def show
        @nation = Nation.find(params[:id])
    end

    def new
        @nation = Nation.new
    end

    def edit
        @nation = Nation.find(params[:id])
    end

    def create
        @nation = Nation.new(params[:nation])
        if @nation.save
            flash[:notice] = 'Nation was successfully created.'
            redirect_to(nations_path)
        else
            render :action => "new"
        end
    end

    def update
        @nation = Nation.find(params[:id])
        if @nation.update_attributes(params[:nation])
            flash[:notice] = 'Nation was successfully updated.'
            redirect_to(nations_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @nation = Nation.find(params[:id])
        @nation.destroy
        redirect_to(nations_path)
    end
end
