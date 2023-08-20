require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  subject { Inventory.new(name: 'Pantry', description: 'A storage place', user:) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is associated with a user' do
    expect(subject.user).to eq(user)
  end

  it 'can have inventory foods' do
    inventory_food = subject.inventory_foods.build
    expect(subject.inventory_foods).to include(inventory_food)
  end

  it 'has a description attribute' do
    expect(subject.description).to eq('A storage place')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
