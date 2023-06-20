class TodayWord < ApplicationRecord

  validates :chinese,          presence: true
  validates :pinyin,           presence: true
  validates :japanese,         presence: true
  validates :example_chinese,  presence: true
  validates :example_japanese, presence: true
  validates :synonym,          presence: true
  validates :description,      presence: true

end
