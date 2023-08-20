class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    @inventories = @recipe.user.inventories
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)

    respond_to do |format|
      format.html { redirect_to @recipe }
    end
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

  def edit
    # Your edit action code goes here
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe Deleted Successfully.'
    redirect_to recipes_path
  end

  def add_new_recipe
    @recipe = Recipe.new
    @recipe.user = current_user
    @recipe.public = true

    if @recipe.save
      redirect_to recipes_index_path, notice: 'New recipe added successfully'
    else
      render :new, notice: @recipe.errors.full_messages
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
