class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).all
  end
end
