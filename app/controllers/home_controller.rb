# encoding: utf-8
class HomeController < ApplicationController

    before_action :authenticate_user! , :except => [:create,:dev]

    def index
    end

    #menu start
    def menu

    end

    def details_profile

    end


    #menu end

    def data
        @users = User.all
    end

    def dev
        @user = User.all.first
        sign_in_and_redirect @user, :event => :authentication
    end

    def create

    end
end

