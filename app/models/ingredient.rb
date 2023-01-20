class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :dishes, through: :recipes
end
