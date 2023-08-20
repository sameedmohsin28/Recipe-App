class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    inventory_id = params[:inventory_id]
    @inventory_food.inventory_id = inventory_id

    if @inventory_food.save
      redirect_to inventory_path(inventory_id), notice: 'Inventory Food has been added.'
    else
      flash.now[:alert] = 'Error! Unable to add food.'
      redirect_to inventory_path(inventory_id), notice: 'Unable to add food has.'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @selected_food = @inventory.inventory_foods.find(params[:id])
    @selected_food.destroy!
    redirect_to @inventory, notice: 'Food has been removed!'
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
