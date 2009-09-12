class AuthorizationsController < ApplicationController
    before_filter :require_user, :authorize

    #TODO implement here
    def index
    end
end
