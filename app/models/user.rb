class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :questions
  has_many :answers,     dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :bookmarks,   dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 10 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-profile_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
