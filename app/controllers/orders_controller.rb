class OrdersController < ApplicationController
  def show
  end

  def create
    @order = Order.new
    @order.dishes = Dish.exclude_ingredients(params[:ingredient_ids])
    @order.save
    redirect_to new_order_path
  end

  def new
    @order = Order.new
    @ingredients = Ingredient.all
  end
end
