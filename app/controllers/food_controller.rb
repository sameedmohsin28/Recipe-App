class FoodController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    puts food_params
    @food = Food.new(food_params)
    if @food.save
      redirect_to new_food_path, notice: 'Food has been added.'
    else
      flash.now[:alert] = 'Error! Unable to add food.'
      render :show
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
