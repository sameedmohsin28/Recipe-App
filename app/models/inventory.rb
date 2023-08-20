class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  has_many :foods, dependent: :destroy

  attribute :description, :text

  validates :name, presence: true
end
