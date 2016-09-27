class ContentSerializer < ActiveModel::Serializer
  attributes :id, :packed
  has_one :item
  has_one :list
end
