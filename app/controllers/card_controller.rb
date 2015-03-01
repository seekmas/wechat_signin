# encoding: utf-8
class CardController < ApplicationController

  before_action :get_card , only: [:index , :new , :comment , :list_comment , :set_medals , :medal , :card_info ]
  #protect_from_forgery with: :null_session

  #首次访问 创建卡片信息
  def index
    respond_to do |format|
        if @card == nil
          format.html { redirect_to new_card_path , :notice => '补充你的资料' }
        else
          format.html { redirect_to show_card_path(:id => @card.id) }
        end
    end
  end

  def user_info_menu

  end

  def comment_on
    @comment = Comment.create({
                                  :user_id => current_user.id ,
                                  :card_id => params[:id] ,
                                  :comment => params[:comment] ,
                              });

    render :text => @comment.id
  end

  #创建/更新卡片
  def new
  end

  #评论
  def comment

  end

  #List相关评论
  def list_comment
    @comments = Comment.includes(:user).where(:card_id => @card.id).order(:id => :desc).all
    respond_to do |format|
      format.json { render :list_comment }
    end
  end

  #展示卡片
  def show
    @card = Card.find(index_id)
  end

  #获取我的徽章
  def show_medal
    @card = Card.find(params[:id])
    @medals = @card.medals
    respond_to do |format|
      format.json { render :show_medal }
    end
  end

  #设置我的徽章
  def set_medals

    if CardMedal.find_by(:card_id => @card.id , :medal_id => params[:medal_id])
      render :text => 'duplicate'
    else
      @medal = Medal.find(params[:medal_id])
      if @card.medals.length >= 3
         @card.medals.delete(@card.medals.first)
         @card.medals << @medal
         @card.save
        render :text => 'override'
      else
        @card.medals << @medal
        @card.save
        render :text => 'insert'
      end
    end
  end

  #所有徽章
  def medal
    @medals = Medal.all
  end

  #日程表
  def scheduler

  end

  #卡片信息 json
  def card_info
    respond_to do |format|
      format.json { render :card_info }
    end

  end

  def save
    if current_user
      @card = Card.find_or_initialize_by(:user_id => current_user.id)
      @card.update(get_params)
      render :text => @card.inspect
    end
  end


  private

  def get_params
    params.permit(:name,:age,:city,:start,:signature,:user_id).merge(user_id: current_user.id)
  end

  def get_card
    @card = Card.find_by(:user_id => current_user.id)
  end

  def index_id
    params[:id]
  end
end
