class Answer < ApplicationRecord
  
  belongs_to :user
  belongs_to :question
  has_many :evaluations, dependent: :destroy

  validates :body, presence: true, length: { maximum: 100 }

end
