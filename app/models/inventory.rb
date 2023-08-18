class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods

  validates :quantity, presence: true
end
