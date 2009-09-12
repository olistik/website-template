class SlugSeoController < ApplicationController
    def index
        @slug_seo = SlugSeo.all
    end

    def show
        @slug_seo = SlugSeo.find(params[:id])
    end

    def new
        @slug_seo = SlugSeo.new
    end

    def edit
        @slug_seo = SlugSeo.find(params[:id])
    end

    def create
        @slug_seo = SlugSeo.new(params[:slug_seo])
        if @slug_seo.save
            flash[:notice] = 'SlugSeo was successfully created.'
            redirect_to(slug_seo_index_path)
        else
            render :action => "new"
        end
    end

    def update
        @slug_seo = SlugSeo.find(params[:id])
        if @slug_seo.update_attributes(params[:slug_seo])
            flash[:notice] = 'SlugSeo was successfully updated.'
            redirect_to(slug_seo_index_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @slug_seo = SlugSeo.find(params[:id])
        @slug_seo.destroy
        redirect_to(slug_seo_index_path)
    end
end
