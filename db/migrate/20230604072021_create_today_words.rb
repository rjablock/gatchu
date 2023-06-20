class CreateTodayWords < ActiveRecord::Migration[6.1]
  def change
    create_table :today_words do |t|

      t.string  :japanese,         null: false
      t.string  :chinese,          null: false
      t.string  :pinyin,           null: false
      t.text    :example_japanese, null: false
      t.text    :example_chinese,  null: false
      t.text    :description,      null: false
      t.string  :synonym,          null: false
      t.boolean :is_active,        null: false, default: true

      t.timestamps
    end
  end
end
