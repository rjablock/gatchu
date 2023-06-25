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
    name: "わんたろう#{n}",
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
    },
    {
      user_id: 3,
      title: "「カーボンニュートラル」は中国語でなんていう？",
      body: "「カーボンニュートラル」は中国語で何ていうのでしょうか。サステナビリティに関するビジネスの議論に使いたいです。
             例えば、「カーボンニュートラルに関する税制の設定は、政府にとって喫緊の課題である」と言いたいです。"
    }
  ]
)

10.times do |n|
  Question.create!(
    user_id: 5,
    title: "「鳥のさえずり」を中国語でいうと？#{n}",
    body: "チュンチュン、というアレです。#{n}"
  )
end

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
    },
    {
      user_id: 6,
      question_id: 4,
      body: "「碳中和（tàn zhōng hé）」といいます。"
    }
  ]
)

puts "--------- create Evaluation"
Evaluation.create!(
  [
    {
      user_id: 3,
      answer_id: 1,
    },
    {
      user_id: 3,
      answer_id: 2,
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
    },
    {
      japanese: "テーマを深掘りする",
      chinese: "深挖主题",
      pinyin: "shēn wā zhǔ tí",
      example_japanese: "今度あのテーマについて深掘りしてディスカッションしてみようよ。",
      example_chinese: "xxx",
      description: "掘る=挖を覚えておけば、ある意味素直",
      synonym: "xxx"
    },
    {
      japanese: "顧客先にアポを取る",
      chinese: "和客户约时间",
      pinyin: "xxx",
      example_japanese: "またあの大変な顧客とアポを取らないといけないのか、嫌だなあ。",
      example_chinese: "xxx",
      description: "アポを取る＝時間を約束する＝约时间で覚えやすい。",
      synonym: "通宵"
    },
    {
      japanese: "徹夜する",
      chinese: "熬夜",
      pinyin: "xxx",
      example_japanese: "昨日徹夜した。なんなら完徹した。",
      example_chinese: "xxx",
      description: "元は明朝時代の小説などから使われていた用語の模様。",
      synonym: "xxx"
    },
    {
      japanese: "有給休暇を取る",
      chinese: "用年假/请年假",
      pinyin: "xxx",
      example_japanese: "彼女とユニバに行くために有給を取った。",
      example_chinese: "xxx",
      description: "中国語で有給は「年」単位の休「暇」で表す。「暇」の漢字が日本語と異なるので注意",
      synonym: "xxx"
    },
    {
      japanese: "計画を練る",
      chinese: "制定计划",
      pinyin: "xxx",
      example_japanese: "不慮の事態に備えて、来月までの計画を練っておこう。",
      example_chinese: "xxx",
      description: "練る、の直接対応するワードはないので、リフレーズが必要。",
      synonym: "xxx"
    },
    {
      japanese: "サービスを提供する",
      chinese: "提供服务",
      pinyin: "xxx",
      example_japanese: "あのお店はいつも最高のサービスを提供してくれる。",
      example_chinese: "xxx",
      description: "職務・任務に服すること→サービス",
      synonym: "xxx"
    },
    {
      japanese: "モチベがない",
      chinese: "没有动力",
      pinyin: "xxx",
      example_japanese: "今週楽しみにしてたデートがリスケになって、全くモチベがないわ。",
      example_chinese: "xxx",
      description: "モチベは動力！がんばれは油を加える（加油）！人間を機械っぽく表現しているのは面白い。",
      synonym: "xxx"
    },
    {
      japanese: "プロに任せる",
      chinese: "交给专业人士",
      pinyin: "xxx",
      example_japanese: "そんなの僕みたいな素人にお願いするより、プロに任せたほうがいいよ。",
      example_chinese: "xxx",
      description: "「人士」は社会的に身分・名声のある人を示す言葉。「〇〇に任せる」=「交给〇〇」もよく使う。「俺に任せとけい！（交给我吧！）」",
      synonym: "xxx"
    },
    {
      japanese: "プレゼンをする",
      chinese: "做展示",
      pinyin: "xxx",
      example_japanese: "500人規模のセミナーでプレゼンをして、緊張した。",
      example_chinese: "xxx",
      description: "プレゼンは展示。",
      synonym: "xxx"
    },
    {
      japanese: "言葉遣いに気をつける",
      chinese: "注意语言表达",
      pinyin: "xxx",
      example_japanese: "少し言葉にトゲがあるから、もう少し言葉遣いに気をつけたほうが良いと思う。",
      example_chinese: "xxx",
      description: "直訳だと、「言語表現に注意する」。少しリフレーズするのが大事。",
      synonym: "xxx"
    },
    {
      japanese: "リスクを取る",
      chinese: "承担风险",
      pinyin: "xxx",
      example_japanese: "彼、リスクを取って銀行から1億円借りたんだって。",
      example_chinese: "xxx",
      description: "承担は「担う」、「背負う」場面でよく使う。風険という表現の由来は、昔の漁業者が嵐を始めとした危険な事態に巻き込まれないよう祈ったことから派生したという説がある。",
      synonym: "xxx"
    },
    {
      japanese: "問題に対処する",
      chinese: "处理问题",
      pinyin: "xxx",
      example_japanese: "何事も冷静に問題に対処しなきゃね。",
      example_chinese: "xxx",
      description: "対処は残念ながらそのまま使えず、「処理」にリフレーズが必要。",
      synonym: "xxx"
    },
    {
      japanese: "クビになる",
      chinese: "炒鱿鱼",
      pinyin: "xxx",
      example_japanese: "今の会社クビになったら、雇ってくれない？",
      example_chinese: "xxx",
      description: "イカを炒めていたら解雇された図をイメージをすると覚えやすい",
      synonym: "xxx"
    },
    {
      japanese: "面接を受ける",
      chinese: "面试",
      pinyin: "xxx",
      example_japanese: "今日はメイドカフェの面接受けることになってるんだ。",
      example_chinese: "xxx",
      description: "「面试」の「面」には既に「受ける」という動詞のニュアンスが含まれる",
      synonym: "xxx"
    },
    {
      japanese: "転職する",
      chinese: "跳槽",
      pinyin: "xxx",
      example_japanese: "転職したけど、転職前より忙しくなっちゃった。",
      example_chinese: "xxx",
      description: "「槽」は昔の飼料を置く場所",
      synonym: "xxx"
    },
    {
      japanese: "作業の引き継ぎを行う",
      chinese: "交接工作",
      pinyin: "xxx",
      example_japanese: "部署異動になったから、作業の引き継ぎをしてるところだよ。",
      example_chinese: "xxx",
      description: "xxx",
      synonym: "xxx"
    },
    {
      japanese: "納品する",
      chinese: "进货",
      pinyin: "xxx",
      example_japanese: "あの報告書、ちゃんと納品間に合った？",
      example_chinese: "xxx",
      description: "xxx",
      synonym: "xxx"
    }
  ]
)

puts "--------- all END"
