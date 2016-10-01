class Content < ActiveRecord::Base
  def self.default_scope
    order('updated_at DESC')
  end

  belongs_to :item, inverse_of: :contents
  belongs_to :list, inverse_of: :contents
  validates_uniqueness_of :item_id, scope: :list_id
end
