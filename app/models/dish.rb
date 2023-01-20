class Dish < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes
end
