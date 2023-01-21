class CreateOrdersDishesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :dishes
  end
end
