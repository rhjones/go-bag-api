require 'rails_helper'

RSpec.describe 'routes for lists' do
  it 'routes GET /lists to the lists#index action' do
    expect(get('/lists')).to route_to('lists#index')
  end

  skip 'routes GET /lists/:id to the lists#show action' do
    # expect(get('/lists/1')).to route_to(
    #   controller: 'lists',
    #   action: 'show',
    #   id: '1'
    # )
  end

  skip 'routes POST /articles to the articles#create action' do
  end

  skip 'routes PATCH /articles/:id to the articles#update action' do
  end

  skip 'routes DELETE /articles/:id to the articles#destroy action' do
  end
end
