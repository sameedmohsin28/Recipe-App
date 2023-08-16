class ShoppingListsController < ApplicationController
  def index
    params[:recipe_id]
    params[:inventory_id]
  end
end
