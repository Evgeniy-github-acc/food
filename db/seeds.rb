# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

file = Rails.root.join('storage', 'menu.yml')
data = YAML::load_file(file)

data['ingredients'].each{ |name| Ingridient.find_or_create_by(name: name) }

data['dishes'].each do |item|
  dish = Dish.find_or_create_by(name: item['name']) do |d|
    item['ingredients'].each{ |name| d.ingredients << Ingredient.find_by(name: name) }
  end
end
