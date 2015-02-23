class SchedulerController < ApplicationController


  def new
    @scheduler = Scheduler.find_or_initialize_by(get_params)
    @scheduler.update(get_params)
    render :text => @scheduler.inspect
  end

  def all
    @schedulers = Scheduler.where(:user_id => current_user.id).all
  end

  private
  def get_params
    params.permit(:context ,:start_date , :end_date , :details ).merge(user_id: current_user.id)
  end

end
