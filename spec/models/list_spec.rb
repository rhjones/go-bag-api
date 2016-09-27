require 'rails_helper'

RSpec.describe List do
  it 'is a list' do
    # if we create a new instance of the article class
    # it should be a List
    # this is self-evidence but will only pass if we have a List model
    expect(List.new).to be_a(List)
  end
end
