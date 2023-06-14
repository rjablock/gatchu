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
  validates :email, uniqueness: true

  enum gender:           { not_answer: 0, male: 1, female: 2 }
  enum age:              { unselected_age: 0, teen: 10, twenties: 20, thirties: 30, forties: 40, fifties: 50, sixties: 60, upper_seventies: 70 }
  enum study_background: { unselected_study_background: 0, lessone: 10, onetothree: 20, threetofive: 30, fivemore: 40 }
  enum living_area:      { unselected_living_area: 0, hokkaido: 10, tohoku: 20, kanto: 30, chubu: 40, kinki: 50, chugoku_shikoku: 60, kyushu: 70, overseas: 80 }
  enum answer_rank:      { normal: 0, master: 10 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-profile_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
