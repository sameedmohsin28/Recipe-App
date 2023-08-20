require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    subject { Food.create(id: 1, name: 'rice', measurement_unit: 'gram', price: 12) }
  end

  context '#validation' do
    it 'should validate_presence_of(:name)' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:measurement_unit)' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_float(:price)' do
      subject.price = '25'
      expect(subject).to_not be_valid
    end
  end
end
