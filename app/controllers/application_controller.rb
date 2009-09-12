class ApplicationController < ActionController::Base
    helper(:all)
    protect_from_forgery()
    before_filter(:instantiate_controller_and_action_names)
    helper_method(:current_user_session, :current_user)
    filter_parameter_logging(:password, :password_confirmation)

    include ExceptionNotifiable

private
    def instantiate_controller_and_action_names()
        @current_action = action_name
        @current_controller = controller_name
    end

    def current_user_session()
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find()
    end

    def current_user()
        return @current_user if defined?(@current_user)
        @current_user = current_user_session() && current_user_session().record
    end

    def require_user()
        unless current_user() or User.all.size == 0
            store_location()
            flash[:notice] = "You must be logged in to access this page"
            redirect_to(new_user_session_url())
            return false
        end
    end

    def require_no_user()
        if current_user()
            store_location()
            flash[:notice] = "You must be logged out to access this page"
            redirect_back_or_default(user_url(current_user()))
            return false
        end
    end

    def store_location()
        session[:return_to] = request.request_uri
    end

    def store_previous_location()
        session[:return_to] = request.env["HTTP_REFERER"]
    end

    def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
    end

    def authorize()
        current_action = CmsAction.find_current(@current_controller, @current_action)
        return true if current_action.nil?  #allow when not specified otherwise
        unless current_action.authorize?(current_user())
            flash[:notice] = "You must be authorized in order to see this content!"
            redirect_back_or_default(user_url(current_user()))
        end
    end
end
