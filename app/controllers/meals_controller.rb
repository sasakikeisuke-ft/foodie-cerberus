class MealsController < ApplicationController
  before_action :meal_form_variable, only: [:new, :edit]
  before_action :common_variable1, only: [:edit, :update, :destroy]

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
      redirect_to meals_path
    else
      meal_form_variable
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  def show
    common_variable2
  end

  def add_tag
    meal_tag_relation = MealTagRelation.new(meal_id: params[:id], tag_id: params[:tag_id])
    if meal_tag_relation.save
      redirect_to meal_path(params[:id])
    else
      common_variable2
      render :show
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :last_day, :link, :price_id, :calorie_id, :labor_id).merge(user_id: current_user.id)
  end

  def common_variable1
    @meal = Meal.find(params[:id])
  end

  def common_variable2
    @meal = Meal.includes(:tags).find(params[:id])
    not_target_tags = MealTagRelation.where(meal_id: params[:id]).select(:tag_id)
    @tags = Tag.where(user_id: current_user.id).where.not(id: not_target_tags)
  end

  def meal_form_variable
  end
end
