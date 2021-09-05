class LogsController < ApplicationController

  def index
    @logs = Log.includes(meal: :tags).where(user_id: current_user.id)
    @meals = Meal.includes(:tags).where(user_id: current_user.id).where.not(id: @logs.select(:meal_id)).order(:last_day)
  end

  def create
  end

  def update
  end

  def destroy
    @log.destroy
    redirect_to root_path
  end

  private

end

# bundle exec rubocop -a
