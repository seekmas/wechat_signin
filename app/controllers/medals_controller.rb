class MedalsController < ApplicationController
  before_action :set_medal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @medals = Medal.all
    respond_with(@medals)
  end

  def show
    respond_with(@medal)
  end

  def new
    @medal = Medal.new
    respond_with(@medal)
  end

  def edit
  end

  def create
    @medal = Medal.new(medal_params)
    @medal.save
    respond_with(@medal)
  end

  def update
    @medal.update(medal_params)
    respond_with(@medal)
  end

  def destroy
    @medal.destroy
    respond_with(@medal)
  end

  private
    def set_medal
      @medal = Medal.find(params[:id])
    end

    def medal_params
      params.require(:medal).permit(:name, :cover, :enabled)
    end
end
