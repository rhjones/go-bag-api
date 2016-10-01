class Item < ActiveRecord::Base
  has_many :lists, through: :contents
  has_many :contents, dependent: :destroy
  validates :name, uniqueness: :true

  def self.search(query)
    where('name LIKE ?', "%#{query}%")
  end
end
