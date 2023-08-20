class FoodController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to food_index_path, notice: 'Food has been added.'
    else
      flash.now[:alert] = 'Error! Unable to add food.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    redirect_to food_path, notice: 'Food has been deleted!'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
