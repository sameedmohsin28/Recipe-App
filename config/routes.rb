# frozen_string_literal: true

Rails.application.routes.draw do
  get 'shopping_list/index'
  # get 'food/index'
  devise_for :users
  get 'public_recipes/index'
  get 'inventories/index'
  get 'inventories/show'
  get 'inventories/new'
  get 'inventories/create'
  get 'inventories/destroy'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/destroy'
  get 'shopping_list', to: 'shopping_lists#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  resources :homes, only: [:index]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :food, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :inventories, only: [:index, :new, :create, :show, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  resources :users do
    resources :recipes
  end
  
end

# resources :inventories, only: [:index, :new, :create, :show, :destroy] do
#   resources :inventory_foods, only: [:index]
# end