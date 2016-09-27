require 'rails_helper'

RSpec.describe 'Lists API' do
  def list_params
    {
      title: 'Hawaii Trip',
      user_id: 1
    }
  end

  def lists
    List.all
  end

  def list
    List.first
  end

  before(:all) do
    List.create!(list_params)
  end

  after(:all) do
    List.delete_all
  end

  describe 'GET /lists' do
    it 'lists all lists' do
      get '/lists'

      expect(response).to be_success

      lists_response = JSON.parse(response.body)
      expect(lists_response.length).to eq(lists.count)
      expect(lists_response.first['title']).to eq(list[:title])
    end
  end

  describe 'GET /lists/:id' do
    skip 'shows one list' do
      # get "/lists/#{list.id}"

      # expect(response).to be_success

      # list_response = JSON.parse(response.body)
      # expect(list_response['id']).not_to be_nil
      # expect(list_response['title']).to eq(list[:title])
    end
  end

  describe 'POST /lists' do
    skip 'creates a list' do
    end
  end

  describe 'PATCH /lists/:id' do
    def list_diff
      { title: 'Scotland Trip' }
    end

    skip 'updates a list' do
    end
  end

  describe 'DELETE /lists/:id' do
    skip 'deletes a list' do
    end
  end
end
