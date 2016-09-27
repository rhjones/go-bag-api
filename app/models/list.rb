class List < ActiveRecord::Base
  has_many :items, through: :contents
  has_many :contents, dependent: :destroy
end
