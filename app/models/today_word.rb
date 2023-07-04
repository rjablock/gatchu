class TodayWord < ApplicationRecord

  validates :chinese,          presence: true, length: { maximum: 6 }
  validates :pinyin,           presence: true
  validates :japanese,         presence: true
  validates :example_chinese,  presence: true
  validates :example_japanese, presence: true
  validates :synonym,          presence: true
  validates :description,      presence: true

end
