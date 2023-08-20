class Food < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
  # Add the necessary attributes
  attribute :name, :string
  attribute :measurement_unit, :string
  attribute :price, :decimal
  attribute :quantity, :integer

  # ... other associations and validations
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { less_than: 1_000_000.0, greater_than_or_equal_to: 0.001 }
end
