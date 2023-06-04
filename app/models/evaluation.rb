class Evaluation < ApplicationRecord

  belongs_to :user
  belongs_to :answer

  enum status: { good: 0, bad: 1 }

end
