# frozen_string_literal: true

Rails.application.routes.draw do
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
  # root "articles#index"
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy]
  resources :public_recipes, only: [:index]
  resources :inventories, only: [:index, :new, :create, :show, :destroy] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
end

# resources :inventories, only: [:index, :new, :create, :show, :destroy] do
#   resources :inventory_foods, only: [:index]
# end