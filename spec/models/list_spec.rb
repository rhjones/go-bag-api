require 'rails_helper'

RSpec.describe List do
  it 'is defined' do
    expect(List.new).to be_a(List)
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
    it do
      should validate_uniqueness_of(:title)
        .scoped_to(:user_id)
        .case_insensitive
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:contents) }
    it { should have_many(:items).through(:contents) }
  end

  describe 'default scope' do
    def user_params
      {
        email: 'alice@example.com',
        password: 'foobarbaz',
        password_confirmation: 'foobarbaz'
      }
    end

    before(:all) do
      user = User.create(user_params)
      @list_one = List.create(title: 'Created first', user: user)
      @list_two = List.create(title: 'Created second', user: user)
    end

    after(:all) do
      List.delete_all
      User.delete_all
    end

    it 'orders by descending updated_at order' do
      expect(List.all).to eq([@list_two, @list_one])
    end
  end
end
