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
      user_id: 2,
      title: "猫は中国語でなんと鳴きますか。",
      body: "ふと気になりました。猫と合わせて犬の鳴き声も一緒に教えていただけますと幸いです。"
    },
    {
      user_id: 3,
      title: "「鳥のさえずり」を中国語でいうと？",
      body: "チュンチュン、というアレです。"
    },
    {
      user_id: 4,
      title: "「カーボンニュートラル」は中国語でなんていう？",
      body: "「カーボンニュートラル」は中国語で何ていうのでしょうか。サステナビリティに関するビジネスの議論に使いたいです。
             例えば、「カーボンニュートラルに関する税制の設定は、政府にとって喫緊の課題である」と言いたいです。"
    },
    {
      user_id: 5,
      title: "友達に気軽に聞きたい時の「最近どう？」を中国語でいうと？",
      body: "特別な意味なく気軽に声をかけるニュアンスで。"
    },
    {
      user_id: 6,
      title: "この度はお忙しい中お集まりいただきありがとうございます。って中国語でなんていうの？",
      body: "セミナー参加者の皆様に向けてお礼の言葉としての言い方です。"
    },
    {
      user_id: 7,
      title: "「○○は駅の反対側にあります」は中国語でなんていう？",
      body: "場所を聞かれた際の回答です"
    },
    {
      user_id: 8,
      title: "この辺でオススメの観光スポットはありますか？って中国語でなんていうの？",
      body: "海外旅行で現地の人に。"
    },
    {
      user_id: 9,
      title: "6連勝もするとは思わなかったよを中国語で言うと？",
      body: "「まさか監督が代わってから6連勝もするとは思わなかったよ」
              Jリーグのサッカーチームの成績についての感想です"
    },
    {
      user_id: 10,
      title: "今日のニュース見た？○○が××と結婚するなんてショックだよねって中国語でなんて言うの？",
      body: "まさかあの人が・・・。言語の壁を超えてこのショックを分かち合いたいです(´-ω-`)"
    },
    {
      user_id: 11,
      title: "今ダイエット中だからご飯少なめでを中国語で言いたい！",
      body: "私の日常生活の中で地味に使用頻度の高い言葉です・・・。"
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
      user_id: 3,
      question_id: 1,
      body: "狗（gǒu）です。また、子犬は小狗（xiǎo ɡǒu）です。"
    },
    {
      user_id: 1,
      question_id: 2,
      body: "猫の鳴き声は中国語で「喵喵（miāo miāo）」と言います。"
    },
    {
      user_id: 5,
      question_id: 3,
      body: "鳥のさえずりを中国語では「叽叽喳喳（jī jī zhā zhā）」と表現します。"
    },
    {
      user_id: 3,
      question_id: 4,
      body: "「碳中和（tàn zhōng hé）」といいます。"
    },
    {
      user_id: 1,
      question_id: 5,
      body: "「最近怎么样？」（zuì jìn zěn me yàng）と言います。"
    },
    {
      user_id: 8,
      question_id: 6,
      body: "その表現は「感謝大家在百忙之中抽出時間來參加。」
            （gǎn xiè dà jiā zài bǎi máng zhī zhōng chōu chū shí jiān lái cān jiā）と言います。"
    },
    {
      user_id: 2,
      question_id: 7,
      body: "「○○在车站的对面。」（○○ zài chē zhàn de duì miàn）と言います。"
    },
    {
      user_id: 1,
      question_id: 8,
      body: "「这附近有什么推荐的旅游景点吗？」
            （zhè fù jìn yǒu shén me tuī jiàn de lǚ yóu jǐng diǎn ma）と言います。"
    },
    {
      user_id: 1,
      question_id: 9,
      body: "「真没想到换了教练之后连赢了六场比赛。」
            （zhēn méi xiǎng dào huàn le jiào liǎn zhī hòu lián yíng le liù chǎng bǐ sài）と言います。"
    },
    {
      user_id: 9,
      question_id: 10,
      body: "「你看了今天的新闻吗？○○和××结婚了，真是让人震惊。」
            （nǐ kàn le jīn tiān de xīn wén ma? ○○ hé ×× jié hūn le, zhēn shì ràng rén zhèn jīng）と言います。"
    },
    {
      user_id: 1,
      question_id: 10,
      body: "今天的新闻你看了吗？我完全没想到○○会和××结婚，太震惊了。
            （jīn tiān de xīn wén nǐ kàn le ma? wǒ wán quán méi xiǎng dào ○○ huì hé ×× jié hūn, tài zhèn jīng le）"
    },
    {
      user_id: 2,
      question_id: 11,
      body: "「我现在正在减肥，所以饭量请少一些。」
            （wǒ xiàn zài zhèng zài jiǎn féi, suǒ yǐ fàn liàng qǐng shǎo yī xiē）と言います。"
    }
  ]
)

puts "--------- create Evaluation"
Evaluation.create!(
  [
    {
      user_id: 5,
      answer_id: 2,
    },
    {
      user_id: 5,
      answer_id: 2,
    },
    {
      user_id: 9,
      answer_id: 4,
    },
    {
      user_id: 11,
      answer_id: 7,
    },
    {
      user_id: 10,
      answer_id: 11,
    },
    {
      user_id: 11,
      answer_id: 11,
    },
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
      example_chinese: "我们下次深入探讨一下那个主题吧。",
      description: "掘る=挖を覚えておけば、ある意味素直",
      synonym: "深度挖掘主题"
    },
    {
      japanese: "顧客先にアポを取る",
      chinese: "和客户约时间",
      pinyin: "hé kè hù yuē shí jiān",
      example_japanese: "またあの大変な顧客とアポを取らないといけないのか、嫌だなあ。",
      example_chinese: "我又要和那个麻烦的客户约时间，真烦。",
      description: "アポを取る＝時間を約束する＝约时间で覚えやすい。",
      synonym: "和客户预约"
    },
    {
      japanese: "徹夜する",
      chinese: "熬夜",
      pinyin: "áo yè",
      example_japanese: "昨日徹夜した。なんなら完徹した。",
      example_chinese: "我昨天熬夜了。甚至通宵了。",
      description: "元は明朝時代の小説などから使われていた用語の模様。",
      synonym: "通宵"
    },
    {
      japanese: "有給休暇を取る",
      chinese: "用年假/请年假",
      pinyin: "yòng nián jià/qǐng nián jià",
      example_japanese: "彼女とユニバに行くために有給を取った。",
      example_chinese: "我请了年假去和女朋友一起去环球影城。",
      description: "中国語で有給は「年」単位の休「暇」で表す。「暇」の漢字が日本語と異なるので注意",
      synonym: "请假"
    },
    {
      japanese: "計画を練る",
      chinese: "制定计划",
      pinyin: "zhì dìng jì huà",
      example_japanese: "不慮の事態に備えて、来月までの計画を練っておこう。",
      example_chinese: "为了应对突发情况，让我们制定下个月的计划。",
      description: "練る、の直接対応するワードはないので、リフレーズが必要。",
      synonym: "制订计划"
    },
    {
      japanese: "サービスを提供する",
      chinese: "提供服务",
      pinyin: "tí gōng fú wù",
      example_japanese: "あのお店はいつも最高のサービスを提供してくれる。",
      example_chinese: "那家店总是提供最好的服务。",
      description: "職務・任務に服すること→サービス",
      synonym: "提供服务"
    },
    {
      japanese: "モチベがない",
      chinese: "没有动力",
      pinyin: "méi yǒu dòng lì",
      example_japanese: "今週楽しみにしてたデートがリスケになって、全くモチベがないわ。",
      example_chinese: "本周我期待的约会被推迟了，我完全没有动力。",
      description: "モチベは動力！がんばれは油を加える（加油）！人間を機械っぽく表現しているのは面白い。",
      synonym: "没有冲劲"
    },
    {
      japanese: "プロに任せる",
      chinese: "交给专业人士",
      pinyin: "jiāo gěi zhuān yè rén shì",
      example_japanese: "そんなの僕みたいな素人にお願いするより、プロに任せたほうがいいよ。",
      example_chinese: "比起请求像我这样的新手，还是交给专业人士更好。",
      description: "「人士」は社会的に身分・名声のある人を示す言葉。「〇〇に任せる」=「交给〇〇」もよく使う。「俺に任せとけい！（交给我吧！）」",
      synonym: "交给专家"
    },
    {
      japanese: "プレゼンをする",
      chinese: "做展示",
      pinyin: "zuò zhǎn shì",
      example_japanese: "500人規模のセミナーでプレゼンをして、緊張した。",
      example_chinese: "在500人的研讨会上做了个展示，我很紧张。",
      description: "プレゼンは展示。",
      synonym: "做演示"
    },
    {
      japanese: "言葉遣いに気をつける",
      chinese: "注意语言表达",
      pinyin: "zhù yì yǔ yán biǎo dá",
      example_japanese: "あの子、言葉遣いに注意しないとダメだよ。",
      example_chinese: "那个孩子，必须注意用词。",
      description: "直訳だと、「言語表現に注意する」。少しリフレーズするのが大事。",
      synonym: "注意言辞"
    },
    {
      japanese: "リスクを取る",
      chinese: "承担风险",
      pinyin: "chéng dān fēng xiǎn",
      example_japanese: "彼、リスクを取って銀行から1億円借りたんだって。",
      example_chinese: "听说他承担风险从银行借了一亿日元。",
      description: "承担は「担う」、「背負う」場面でよく使う。風陪という表現の由来は、昔の漁業者が嵐を始めとした危険な事態に巻き込まれないよう祈ったことから派生したという説がある。",
      synonym: "冒险"
    },
    {
      japanese: "問題に対処する",
      chinese: "处理问题",
      pinyin: "chǔ lǐ wèn tí",
      example_japanese: "何事も冷静に問題に対処しなきゃね。",
      example_chinese: "我们必须冷静地处理所有问题。",
      description: "対処は残念ながらそのまま使えず、「処理」にリフレーズが必要。",
      synonym: "应对问题"
    },
    {
      japanese: "クビになる",
      chinese: "炒鱿鱼",
      pinyin: "chǎo yóu yú",
      example_japanese: "今の会社クビになったら、雇ってくれない？",
      example_chinese: "如果我被现在的公司炒鱿鱼了，你能不能雇佣我？",
      description: "イカを炒めていたら解雇された図をイメージをすると覚えやすい",
      synonym: "被解雇"
    },
    {
      japanese: "面接を受ける",
      chinese: "面试",
      pinyin: "miàn shì",
      example_japanese: "今日はメイドカフェの面接受けることになってるんだ。",
      example_chinese: "我今天要去一个女仆咖啡店面试。",
      description: "「面试」の「面」には既に「受ける」という動詞のニュアンスが含まれる",
      synonym: "进行面试"
    },
    {
      japanese: "転職する",
      chinese: "跳槽",
      pinyin: "tiào cáo",
      example_japanese: "昨日、会社の友達が転職すると言っていた。",
      example_chinese: "昨天，我公司的朋友说他要跳槽。",
      description: "「槽」は昔の飼料を置く場所",
      synonym: "换工作"
    }
  ]
)

puts "--------- all END"
