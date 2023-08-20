class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id

    if @inventory.save
      flash[:notice] = 'inventory was successfully created.'
      redirect_to inventories_path
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = 'inventory Deleted Successfully.'
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
