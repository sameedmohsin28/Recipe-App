require 'rails_helper'

require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { User.create(id: 1, name: 'Paul', email: 'paul@test.com') }
  let(:inventory) { Inventory.create(id: 1, user_id: user.id, name: 'Joll of Rice', description: 'I love it') }
  let(:food) {Food.create(id: 1, name: 'rice', measurement_unit: 'gram', price: 12)}

  subject { InventoryFood.create(quantity: 10, inventory_id: inventory.id, food_id: food.id) }

  context '#validation' do
    it 'should validate_integer of(:quantity)' do
      subject.quantity = 1.5
      expect(subject).to_not be_valid
    end

    it 'should validate_exactness of(:quantity)' do
      expect(subject.quantity).to eq(10)
    end
  end

  context 'check associations between InventoryFood and Inventory' do
    it 'should belong to an Inventory' do
      expect(subject.inventory_id).to eq(inventory.id)
    end
  end

  context 'check associations between InventoryFood and Food' do
    it 'should belong to an Inventory' do
      expect(subject.food_id).to eq(food.id)
    end
  end
end