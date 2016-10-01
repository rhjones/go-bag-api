class Content < ActiveRecord::Base
  def self.default_scope
    order('updated_at DESC')
  end

  belongs_to :item, inverse_of: :contents
  belongs_to :list, inverse_of: :contents
  validates :item_id, uniqueness: { scope: :list_id }
end
