class HomeController < ApplicationController
    def index
        render :text => Devise.friendly_token[0,6]
    end

end
