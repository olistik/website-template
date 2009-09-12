class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def new
        @customer = Customer.new
        @nations = Nation.all_for_select
    end

    def edit
        @customer = Customer.find(params[:id])
        @nations = Nation.all_for_select
        @regions = Region.all_by_nation_id_for_select @customer.city.province.region.nation
        @provinces = Province.all_by_region_id_for_select @customer.city.province.region
        @cities = City.all_by_province_id_for_select @customer.city.province
    end

    def create
        @customer = Customer.new(params[:customer])
        if @customer.save
            flash[:notice] = 'Customer was successfully created.'
            redirect_to(customers_path)
        else
            render :action => "new"
        end
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update_attributes(params[:customer])
            flash[:notice] = 'Customer was successfully updated.'
            redirect_to(customers_path)
        else
            render :action => "edit"
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to(customers_path)
    end
end
