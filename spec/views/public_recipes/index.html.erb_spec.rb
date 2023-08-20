require 'rails_helper'

RSpec.describe 'public_recipes/index.html.erb', type: :view do
  before do
    @user1 = User.create(name: 'Alex', email: 'alex@gmail.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Kebab', preparation_time: '5 hrs', cooking_time: '1 hr',
                             description: 'Fry the meat', public: true, user_id: @user1.id)
    @recipe2 = Recipe.create(name: 'Biryani', preparation_time: '3 hrs', cooking_time: '2 hrs',
                             description: 'Cook rice and curry', public: false, user_id: @user1.id)
    @food1 = Food.create(name: 'Chicken', measurement_unit: 'grams', price: 30)
    @food2 = Food.create(name: 'Oil', measurement_unit: 'ml', price: 20)
    @recipefood1 = RecipeFood.create(quantity: 20, food_id: @food1.id, recipe_id: @recipe1.id)
    @recipefood2 = RecipeFood.create(quantity: 30, food_id: @food2.id, recipe_id: @recipe1.id)

    visit public_recipes_index_path
  end

  scenario 'does not display private recipe' do
    expect(page).not_to have_content('Biryani')
  end

  scenario 'displays public recipe name' do
    expect(page).to have_content('Kebab')
  end

  scenario 'displays user name' do
    expect(page).to have_content('Alex')
  end

  scenario 'displays total food items' do
    expect(page).to have_content('2')
  end

  scenario 'displays total price' do
    expect(page).to have_content('1200')
  end

  scenario 'redirects to the recipe show page' do
    click_link @recipe1.name
    expect(page).to have_current_path(recipe_path(@recipe1))
  end
end
