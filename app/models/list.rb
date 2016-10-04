class List < ActiveRecord::Base
  belongs_to :user
  validates :title, :user, presence: true
  validates :title, uniqueness: { scope: :user_id, case_sensitive: false }
  has_many :items, through: :contents
  has_many :contents, dependent: :destroy

  def self.default_scope
    order(updated_at: :desc)
  end
end
