# encoding: utf-8
class HomeController < ApplicationController

    before_action :authenticate_user!

    def index

    end

    def data

        @users = User.all

    end

    def trail
        @user = User.find(1)
        sign_in_and_redirect @user, :event => :authentication
    end
end
