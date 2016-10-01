class ListSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
  has_many :contents
end
