class InventoriesController < ApplicationController
  def index; end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.inventory_foods
  end

  def new; end

  def create; end

  def destroy; end
end
