class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :lists
end
