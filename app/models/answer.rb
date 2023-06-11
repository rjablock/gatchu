class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :evaluations, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }

  def evaluated_by?(user)
    evaluations.exists?(user_id: user.id)
  end

end
