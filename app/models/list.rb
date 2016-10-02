class List < ActiveRecord::Base
  belongs_to :user
  validates :title, :user, presence: true
  validates :title, uniqueness: { scope: :user_id }
  has_many :items, through: :contents
  has_many :contents, dependent: :destroy
end
