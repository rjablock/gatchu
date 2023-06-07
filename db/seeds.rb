# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "--------- create Admin"
Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS']
)

puts "--------- create User"
User.create!(
  [
    {
      email: 'test@gmail.com',
      password: '0000000000',
      name: 'わんごろう',
      introduction:  '犬といったら犬なんです',
      gender: 2,
      age: 10,
      study_background: 10,
      living_area: 70,
      answer_rank: 10
    }
  ]
)

10.times do |n|
  User.create!(
    email: "user#{n}@gmail.com",
    password: "0000000000",
    name: "わんごろう#{n}",
    introduction:  '犬といったら犬なんです',
    gender: 0,
    age: 20,
    study_background: 20,
    living_area: 40,
    answer_rank: 0
  )
end

puts "--------- create Question"
Question.create!(
  [
    {
      user_id: 1,
      title: "犬は中国語でなんというのですか？",
      body: "犬は中国語でなんというのか、気になって夜しか眠れません。教えてください!"
    },
    {
      user_id: 7,
      title: "猫は中国語でなんと鳴きますか。",
      body: "ふと気になりました。猫と合わせて犬の鳴き声も一緒に教えていただけますと幸いです。"
    },
    {
      user_id: 5,
      title: "「鳥のさえずり」を中国語でいうと？",
      body: "チュンチュン、というアレです。"
    }
  ]
)

puts "--------- create Answer"
Answer.create!(
  [
    {
      user_id: 2,
      question_id: 1,
      body: "犬は中国語で狗（gǒu）といいます。"
    },
    {
      user_id: 4,
      question_id: 1,
      body: "狗（gǒu）です。また、子犬は小狗（xiǎo ɡǒu）です。"
    }
  ]
)

puts "--------- create Evaluation"
Evaluation.create!(
  [
    {
      user_id: 3,
      answer_id: 1,
      status: 0
    },
    {
      user_id: 3,
      answer_id: 2,
      status: 1
    }
  ]
)

puts "--------- create Genre"
Genre.create!(
  [
    {
      name: "運営の日記"
    },
    {
      name: "資格試験情報"
    },
    {
      name: "勉強のコツ"
    }
  ]
)

puts "--------- create Post"
post = Post.create!(
  genre_id: 1,
  title: "当サイトがオープンしました！",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample1.jpg')), filename: 'sample1.jpg')

post = Post.create!(
  genre_id: 2,
  title: "次の試験の日程は・・・？",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample2.jpg')), filename: 'sample2.jpg')

post = Post.create!(
  genre_id: 3,
  title: "集中のコツ、教えます",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample3.jpg')), filename: 'sample3.jpg')

post = Post.create!(
  genre_id: 1,
  title: "昨日は中国で開かれた会議に出席してきました",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample4.jpg')), filename: 'sample4.jpg')

post = Post.create!(
  genre_id: 2,
  title: "スグ使える！有用な中国語資格とは？",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample5.jpg')), filename: 'sample5.jpg')

post = Post.create!(
  genre_id: 3,
  title: "長すぎるのもよくない！ほどよい勉強時間とは",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)
post.image.attach(io: File.open(Rails.root.join('db/samples/sample6.jpg')), filename: 'sample6.jpg')

Post.create!(
  genre_id: 1,
  title: "紅葉が綺麗な季節になりましたね",
  body: "本文です本文です本文です本文です本文です本文です本文です本文です本文です",
  is_active: true
)

puts "--------- create Bookmark"
Bookmark.create!(
  [
    {
      user_id: 1,
      question_id: 1
    },
    {
      user_id: 1,
      question_id: 2
    },
    {
      user_id: 4,
      question_id: 1
    },
    {
      user_id: 5,
      question_id: 2
    },
    {
      user_id: 5,
      question_id: 3
    },
    {
      user_id: 6,
      question_id: 1
    }
  ]
)

puts "--------- create TodayWord"
TodayWord.create!(
  [
    {
      japanese: "犬",
      chinese: "狗",
      pinyin: "gǒu",
      example_japanese: "もし最遊記に犬が登場するのなら、絶対見るのになあ。",
      example_chinese: "如果《最游记》中有一只狗出场的话，我一定就会去看的。",
      description: "中国には奇妙な犬の神話がたくさんあります。",
      synonym: "小狗"
    }
  ]
)

10.times do |n|
  TodayWord.create!(
    japanese: "犬#{n}",
    chinese: "狗#{n}",
    pinyin: "gǒu#{n}",
    example_japanese: "#{n}もし最遊記に犬が登場するのなら、絶対見るのになあ。",
    example_chinese: "#{n}如果《最游记》中有一只狗出场的话，我一定就会去看的。",
    description: "#{n}中国には奇妙な犬の神話がたくさんあります。",
    synonym: "小狗#{n}"
  )
end

puts "--------- all END"
