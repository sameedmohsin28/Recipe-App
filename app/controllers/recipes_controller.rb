class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end


  def public_recipes
    @recipes = Recipe.where(public: true)
    
  def show
    @recipe = Recipe.find(params[:id])

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = 'Recipe was successfully created.'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def edit; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe Deleted Successfully.'
    redirect_to recipes_path
  end

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

    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
<<<<<<< HEAD
=======
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
>>>>>>> 410ac617b8d12f271d1cf168b013b35fe745cf9c
