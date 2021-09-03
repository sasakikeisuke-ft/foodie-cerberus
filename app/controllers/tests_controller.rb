class TestsController < ApplicationController
  def index
    @meals = Meal.all
  end
end
