class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :contents
end
