class MealsController < ApplicationController
  before_action :meal_form_variable, only: [:new, :edit]
  before_action :common_variable1, only: [:edit, :update, :destroy, :show]

  def index
    @meals = Meal.where(user_id: current_user.id).order(:last_day)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path
    else
      meal_form_variable
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to root_path
    else
      meal_form_variable
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to root_path
  end

  def show
    @tags = Tag.where(user_id: current_user.id)
    @meal_tag_relations = MealTagRelation.where(meal_id: params[:meal_id])
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :last_day, :link, :price_id, :calorie_id, :labor_id).merge(user_id: current_user.id)
  end

  def common_variable1
    @meal = Meal.find(params[:id])
  end

  def meal_form_variable
  end
end
