class Food < ApplicationRecord
  belongs_to :user
  # Add the necessary attributes
  attribute :name, :string
  attribute :measurement_unit, :string
  attribute :price, :decimal
  attribute :quantity, :integer

  # ... other associations and validations
end
