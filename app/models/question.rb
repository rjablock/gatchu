class Question < ApplicationRecord
  
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body,  presence: true, length: { maximum: 300 }

end
