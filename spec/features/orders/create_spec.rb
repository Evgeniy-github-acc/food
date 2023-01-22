require 'rails_helper'

feature 'User can pick ingredients to exclude dishes which contains it from order' do
  let!(:ingredients) { create_list(:ingredient, 4) }
  let!(:dish) { create(:dish, ingredients: ingredients.first(2)) }
  
  describe 'case when dishes are available for set of ingredients' do
    before do
      visit new_order_path
      click_on 'Send Order'
    end

    it 'renders all ingredients' do
      ingredients.each do |item|
        expect(page).to have_content item.name
      end
    end 
    
    it 'creates new order' do
      expect(page).to have_content 'Your order has been created'
    end
  end

  describe 'case when no available dishes for set of ingredients' do
    before do
      visit new_order_path
      all('input[type=checkbox]').each{ |checkbox| checkbox.click }
      click_on 'Send Order'
    end

    it 'doesnt create order' do
      expect(page).to have_content "No dishes available with such set of ingredients"
    end
  end
end
