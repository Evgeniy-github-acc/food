class OrdersController < ApplicationController
  before_action :load_ingredients, only: %i[new]
  
  def dish_counts
    @dish_counts = Order.dish_counts
    render json: @dish_counts
  end
  
  def create
    @order = Order.new
    @order.dishes = Dish.exclude_ingredients(params[:ingredient_ids])
    if @order.dishes.empty?
      flash[:notice] = "No dishes available with such set of ingredients"
    else
      @order.save
      flash[:notice] = "Your order has been created"
    end
    redirect_to new_order_path
  end

  def new
    @order = Order.new
  end

  private

  def load_ingredients
    @ingredients = Ingredient.all
  end
end
