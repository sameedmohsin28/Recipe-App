require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = User.create(name: 'Alex', email: 'alex@gmail.com', password: '123456')
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
