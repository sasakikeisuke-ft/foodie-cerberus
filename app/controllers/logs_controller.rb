class LogsController < ApplicationController
  before_action :common_variable1, only: [:index]

  def index
  end

  def create
    log = Log.new(meal_id: params[:id], user_id: current_user.id)
    if log.save
      redirect_to logs_path
    else
      common_variable1
      render :index
    end
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to logs_path
  end

  def last_day_update
    logs = Log.where(user_id: current_user.id)
    meals = Meal.where(id: logs.select(:meal_id))
    meals.update_all(last_day: Date.today)
    logs.destroy_all
    redirect_to logs_path
  end

  def all_delete
    log = Log.where(user_id: current_user.id)
    log.destroy_all
    redirect_to logs_path
  end

  private

  def common_variable1
    @logs = Log.includes(meal: :tags).where(user_id: current_user.id)
    @meals = Meal.includes(:tags).where(user_id: current_user.id).where.not(id: @logs.select(:meal_id)).order(:last_day)
  end
end
