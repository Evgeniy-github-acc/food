require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:dish) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
  
  describe 'associations' do
    it { should have_many(:recipes) }
    it { should have_many(:ingredients).through(:recipes) }  
  end
end
