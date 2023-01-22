require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:ingredients) { create_list(:ingredient, 4) }
  let!(:dish1) { create(:dish, ingredients: ingredients.first(2)) }  
  let!(:dish2) { create(:dish, ingredients: ingredients.last(2)) }

  describe "POST #create" do
    

    it 'doesnt create order without dishes' do
      ids  = dish1.ingredients.ids + dish2.ingredients.ids
      expect { post :create, params: { ingredient_ids: ids } }.to_not change(Order, :count)
    end
    
    it 'saves order to database' do
      expect { post :create, params: { ingredient_ids: ingredients.first.id } }.to change(Order, :count).by(1)
    end

    it 'assignes available dishes to order' do
      expect { post :create, params: { ingredient_ids: dish1.ingredients.ids.first } }.to change(dish2.orders, :count).by(1)
    end

    it 'doesnt assign to order dishes with excluded ingredients' do
      expect { post :create, params: { ingredient_ids: dish1.ingredients.ids.first } }.to_not change(dish1.orders, :count)
    end
  end
end
