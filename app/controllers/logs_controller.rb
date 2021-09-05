class LogsController < ApplicationController

  def index
    @logs = Log.where(user_id: current_user.id)
    @logs = Log.includes(meal: :tags).where(user_id: current_user.id)
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
