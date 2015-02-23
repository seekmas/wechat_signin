# encoding: utf-8
class CardController < ApplicationController

  #protect_from_forgery with: :null_session

  def index
    @card = Card.find_by(:user_id => current_user.id)

    respond_to do |format|
        if @card == nil
          format.html { redirect_to new_card_path , :notice => '补充你的资料' }
        else
          format.html { redirect_to show_card_path(:id => @card.id) }
        end
    end
  end

  def new

  end

  def show
    @card = Card.find(index_id)
  end

  def scheduler

  end

  def save
    if current_user

      @card = Card.find_or_initialize_by(:user_id => current_user.id)
      @card.update(get_params)
      render :text => @card.inspect
    else
      render :text => current_user.inspect
    end
  end


  private

  def get_params
    params.permit(:name,:age,:city,:start,:signature,:user_id).merge(user_id: current_user.id)
  end

  def index_id
    params[:id]
  end
end
