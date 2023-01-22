require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '.dish_counts' do
    it 'returns a list of dishes with their order counts in descending order' do
      dish1 = create(:dish)
      dish2 = create(:dish)
      create_list(:order, 3, dishes: [dish1])
      create_list(:order, 2, dishes: [dish2])

      result = Order.dish_counts

      expect(result).to eq([
        { name: dish1.name, count: 3 },
        { name: dish2.name, count: 2 }
      ])
    end
  end
end
