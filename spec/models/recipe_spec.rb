context '#data' do
  it 'user_id should be present' do
    @recipe.user = nil # Instead of @recipe.user_id
    expect(@recipe).to_not be_valid
  end

  it 'name should be present and not exceed 250 characters' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid

    @recipe.name = 'a' * 250
    expect(@recipe).to be_valid

    @recipe.name = 'a' * 251
    expect(@recipe).to_not be_valid
  end

  it 'is_public should be boolean' do
    @recipe.is_public = false
    expect(@recipe).to be_valid

    @recipe.is_public = true
    expect(@recipe).to be_valid
  end

  it 'preparation_time should be present and greater than or equal to zero' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid

    @recipe.preparation_time = 0
    expect(@recipe).to be_valid
  end

  it 'cooking_time should be present and greater than or equal to zero' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid

    @recipe.cooking_time = 0
    expect(@recipe).to be_valid
  end
end
