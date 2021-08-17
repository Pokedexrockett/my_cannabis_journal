class GrowersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @growers = Grower.alpha
    end 
end
