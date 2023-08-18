class RecipesController < ApplicationController
  def index; end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.public = true
    if @recipe.save
      redirect_to recipes_index_path, notice: 'New recipe added successfully'
    else
      render :new, notice: @recipe.errors.full_messages
    end
  end

  def destroy; end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
