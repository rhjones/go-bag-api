require 'rails_helper'

RSpec.describe ListsController do
  # set up methods so we can run our tests
  def list_params
    {
      title: 'Hawaii Trip',
      user_id: User.first.id
    }
  end

  def list
    List.first
  end

  # create a list for testing
  before(:all) do
    List.create!(list_params)
  end

  # delete everything after testing
  after(:all) do
    List.delete_all
  end
  # end methods to help us run our tests

  describe 'GET index' do
    # before each one of these tests, do something first
    before(:each) { get :index }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      lists_collection = JSON.parse(response.body)
      expect(lists_collection).not_to be_nil
      expect(lists_collection.first['title']).to eq(list.title)
    end
  end

  describe 'GET show' do
    # before(:each) { get :show, id: list.id }
    skip 'is successful' do
      # expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      # list_response = JSON.parse(response.body)
      # expect(list_response['id']).not_to be_nil
      # expect(list_response['title']).to eq(list[:title])
      # # puts 'list response is '
      # # puts list_response
    end

    # checks to make sure we have a hash (single list),
    # not an array (multiple lists)
    # this is extra/not strictly necessary
    skip 'renders a hash' do
      # list_response = JSON.parse(response.body)
      # expect(list_response).to a_kind_of(Hash)
    end
  end

  describe 'POST create' do
    # before(:each) do
    #   post :create, list: list_params, format: :json
    # end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'PATCH update' do
    def list_diff
      { title: 'Scotland Trip' }
    end

    # before(:each) do
    #   patch :update, id: list.id, list: list_diff, format: :json
    # end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
    end
  end
end
