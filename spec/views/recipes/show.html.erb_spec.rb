require 'rails_helper'

RSpec.feature 'recipes/show.html.erb', type: :feature do
  before do
    @user1 = User.create(name: 'Alex', email: 'alex@gmail.com', password: '123456')
    @recipe1 = Recipe.create(name: 'Kebab', preparation_time: '5 hrs', cooking_time: '1 hr',
                             description: 'Fry the meat', public: false, user_id: @user1.id)
    @food1 = Food.create(name: 'Chicken', measurement_unit: 'grams', price: 30)
    @food2 = Food.create(name: 'Oil', measurement_unit: 'ml', price: 20)
    @recipefood1 = RecipeFood.create(quantity: 20, food_id: @food1.id, recipe_id: @recipe1.id)
    @recipefood2 = RecipeFood.create(quantity: 30, food_id: @food2.id, recipe_id: @recipe1.id)

    visit recipe_path(@recipe1)
  end

  scenario 'displays recipe name' do
    expect(page).to have_content('Kebab')
  end

  scenario 'displays preparation time' do
    expect(page).to have_content('5 hrs')
  end

  scenario 'displays cooking time' do
    expect(page).to have_content('1 hr')
  end

  scenario 'displays description' do
    expect(page).to have_content('Fry the meat')
  end

  scenario 'displays public attribute' do
    expect(page).to have_content('No')
  end

  scenario 'displays recipe foods' do
    expect(page).to have_content('Chicken')
    expect(page).to have_content('Oil')
  end

  scenario 'displays food quantity' do
    expect(page).to have_content('20')
    expect(page).to have_content('30')
  end

  scenario 'displays food value' do
    expect(page).to have_content('600')
    expect(page).to have_content('600')
  end
end
