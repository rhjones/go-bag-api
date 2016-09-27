class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
end
