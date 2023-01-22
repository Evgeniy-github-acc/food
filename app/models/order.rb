class Order < ApplicationRecord
  has_and_belongs_to_many :dishes

  def self.dish_counts
    dishes = joins(:dishes).group(:name).count
    dishes.map { |name, count| { name: name, count: count } }.sort_by { |dish| -dish[:count] }
  end
end
