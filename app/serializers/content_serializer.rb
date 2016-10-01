class ContentSerializer < ActiveModel::Serializer
  attributes :id, :packed, :item
  has_one :list
end
