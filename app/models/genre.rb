class Genre < ApplicationRecord

  has_many :posts

  validates :name, presence: true, uniqueness: true, length: { maximum: 6 }

end
