class List < ActiveRecord::Base
  validates :title, presence: true
  has_many :items, through: :contents
  has_many :contents, dependent: :destroy
  belongs_to :user
end
