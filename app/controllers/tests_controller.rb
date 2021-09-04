class TestsController < ApplicationController
  def index
    @meals = Meal.all
    @tags = Tag.all
  end
end
