class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :recipe_foods, dependent: :destroy
  has_many :foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  validates :public, presence: true, allow_blank: true

  attribute :public, :boolean, default: true

  def total_price
    foods.sum(:price)
  end
end
