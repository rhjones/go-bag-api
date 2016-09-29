require 'rails_helper'

RSpec.describe List do
  it 'is defined' do
    expect(List.new).to be_a(List)
  end

  describe 'validations' do
    def valid_params
      { title: 'NH hiking' }
    end

    it 'validates the presence of a list\'s title' do
      expect(List.create(valid_params)).to be_valid
    end

    it 'list is invalid without title' do
      invalid_params = {}
      expect(List.create(invalid_params)).to be_invalid
    end
  end

  # do I need to describe contents association as well?
  # or, given that items association is through contents, is this sufficient?

  describe 'items association' do
    def items_association
      described_class.reflect_on_association(:items)
    end

    it 'has the name items' do
      expect(items_association).to_not be_nil
      expect(items_association.name).to eq(:items)
    end

    it 'is a has_many association' do
      expect(items_association.macro).to eq(:has_many)
    end
  end

  describe 'user association' do
    def user_association
      described_class.reflect_on_association(:user)
    end

    it 'has the name user' do
      expect(user_association).to_not be_nil
      expect(user_association.name).to eq(:user)
    end

    it 'is a belongs_to association' do
      expect(user_association.macro).to eq(:belongs_to)
    end
  end
end
