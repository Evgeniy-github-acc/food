require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:ingredient) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
  
  describe 'associations' do
    it { should have_many(:recipes) }
    it { should have_many(:dishes).through(:recipes) }  
  end
end
