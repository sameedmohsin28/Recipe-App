class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food.recipe_id = @recipe.id
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Food added succesfully'
    else
      render :new, notice: 'Error'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe Food added succesfully'
    else
      render :new, notice: 'Error'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe = @recipe_food.recipe
    if @recipe_food.destroy!
      redirect_to recipes_show_path(recipe), notice: 'Recipe food deleted'
    else
      flash.now[:alert] = 'Unable to delete recipe'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
