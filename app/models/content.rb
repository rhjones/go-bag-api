class Content < ActiveRecord::Base
  belongs_to :item, inverse_of: :contents
  belongs_to :list, inverse_of: :contents
end
