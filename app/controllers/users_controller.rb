class UsersController < ApplicationController
    before_filter :require_user
#    before_filter :authorize, :only => [:index, :new, :create, :update, :delete]

    def new()
        @user = User.new()
    end

    def create()
        @user = User.new(params[:user])
        if @user.save() and update_roles()
            if User.all.size == 1
                flash[:notice] = "Ora devi effettuare l'accesso!"
                redirect_to root_path
                return
            end
            flash[:notice] = "Account registrato!"
            redirect_to(users_path)
        else
            render(:action => :new)
        end
    end

    def show()
        @user = User.find(params[:id])
    end

    def edit()
        @user = User.find(params[:id])
    end

    def update()
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user]) and update_roles()
            flash[:notice] = "Account aggiornato!"
            redirect_to(users_path)
        else
            render(:action => :edit)
        end
    end

    def index()
        @users = User.all()
    end

    def destroy()
        User.destroy(params[:id])
        redirect_to(users_path)
    end

private
    def update_roles(roles_ids = params[:roles_ids])
        @user.roles.clear()
        for role_id in roles_ids do
            @user.roles << Role.find(role_id)
        end
    end
end

