class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body,  presence: true, length: { maximum: 300 }

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def increment_views_count!
    increment!(:views_count)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[title body]
  end

end
