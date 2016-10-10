require 'rails_helper'

RSpec.describe 'Lists API' do
  def list_params
    {
      title: 'New Example List',
      user: user
    }
  end

  def lists
    List.all
  end

  def list
    List.first
  end

  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def user
    User.first
  end

  before(:all) do
    User.create!(user_params)
    List.create!(list_params)
  end

  after(:all) do
    List.destroy_all
    User.destroy_all
  end

  context 'while authenticated' do
    

    before(:each) do
      # post '/sign-up', credentials: user_params
      post '/sign-in', credentials: user_params

      @token = JSON.parse(response.body)['user']['token']

      @user_id = JSON.parse(response.body)['user']['id']
      @user = User.first
      # @token = @user.token
      puts "user.id #{user.id}"
      puts "@user_id #{@user_id}"
      puts "@user.id #{@user.id}"

      puts "current user.token #{user.token}"
      puts "current @user.token #{@user.token}"
      puts "current @token #{@token}"

      # def user_by_token
      #   User.find_by(token: @token).id
      # end

      # puts "user_by_token #{user_by_token}"

      # List.create!(list_params)
    end

    describe 'GET /lists' do
      it 'lists all lists' do
        def headers
          {
            'HTTP_AUTHORIZATION' => "Token token=#{@token}"
            # 'HTTP_AUTHORIZATION' => "Token token=#{@user.token}"
          }
        end
        get '/lists', headers

        expect(response).to be_success

        lists_response = JSON.parse(response.body)
        expect(lists_response.length).to eq(lists.count)
        expect(lists_response.first['title']).to eq(list[:title])
      end
    end
  end
end
