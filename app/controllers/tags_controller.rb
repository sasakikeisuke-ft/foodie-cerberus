class TagsController < ApplicationController
  before_action :tag_form_variable, only: [:new, :edit]
  before_action :common_variable1, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.where(user_id: current_user.id).order(:category_id)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tag_path(@tag)
    else
      tag_form_variable
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag)
    else
      tag_form_variable
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  def show
    @tag = Tag.includes(:meals).find(params[:id])
    not_target_meals = MealTagRelation.where(tag_id: params[:id]).select(:meal_id)
    @meals = Meal.where(user_id: current_user.id).where.not(id: not_target_meals).order(:last_day)
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :category_id).merge(user_id: current_user.id)
  end

  def common_variable1
    @tag = Tag.find(params[:id])
  end

  def tag_form_variable
  end

end
