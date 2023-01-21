class Dish < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :ingredients, through: :recipes
  has_and_belongs_to_many :orders

  scope :exclude_ingredients, -> (ingredient_ids) {
    where.not(id: joins(:ingredients)
    .where(ingredients: { id: ingredient_ids })
    .select(:id)) }
end
