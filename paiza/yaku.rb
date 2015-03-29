#--------------------------------------------------------------------
# 入力値(カード)から、役の名前を返す。
# **説明**
# コマンドラインから4つの数値、または、*を入力する。
# 入力値から、
#  「FourCard」「ThreeCard」「TwoPair」「OnePair」「NoPair」の
#      役を判定し、出力する。
#--------------------------------------------------------------------

def analyze(cards = [])
  #入力値を解析し、カードごとの枚数を格納する
  numCard = Array.new
  j = 0 #配列カウンタ
  same = 0 #同じカードの枚数を保持
  oldcard = "" #比較対象退避用の変数
  
  for i in 0...cards.length do
    #一周目だけ(比較用の値をセット)
    if i == 0
      oldcard = cards[i]
    end
    #配列にカード枚数を格納
    if oldcard != cards[i]
      numCard[j] = same
      same = 0
      j += 1 #配列カウントアップ
    end
    #１つ前のカードを退避
    oldcard = cards[i]
    #同じ数字が何回続くかをカウント
    same += 1
  end
  #最後の種類のカード枚数を格納
  numCard[j] = same

  return numCard
end

#役を判定
def hantei(cards,numCard)
  #カード枚数チェック(4枚？)
  w1 = numCard.select{|v|  v == 4}
  if w1.length == 1
    puts "FourCard"
    exit
  end
  #カード枚数チェック(3枚？)
  w1 = numCard.select{|v|  v == 3}
  if w1.length == 1
    #入力値の中に*があるか？
    w2 =  cards.select{|v| v == "*"}
    if w2.length == 1
      puts "FourCard"
    else
      puts "ThreeCard"
    end
    exit
  end
  #カード枚数チェック(2枚連続はあるか？)
  w1 = numCard.select{|v|  v == 2}
  #入力値の中に*はいくつある？
  w2 =  cards.select{|v| v == "*"}
  #ペア(2枚連続)が2個の場合...
  if w1.length == 2
    case w2.length
      when 2
        puts "FourCard"
      when 1
        puts "ThreeCard"
      when 0
        puts "TwoPair"
    end
    exit
  end
  #ペア1の場合...
  if w1.length == 1
    
    if w2.length == 2
      puts "FourCard"
    elsif w2.length == 1 
      puts "ThreeCard"
    else
      puts "OnePair"
    end
    exit
  end
  #何もなければ...
  if w1.length == 0
    #入力値の中に*がいくつあるか？
    w2 =  cards.select{|v| v == "*"}
    if w2.length == 3
      puts "FourCard"
    elsif w2.length == 2 
      puts "ThreeCard"
    elsif w2.length == 1
    puts "OnePair"
    else
      puts "NoPair"
    end
  end
end

def yaku(cards = [])
  #カードを整列
  cards = cards.sort
  #カードの中身チェック
  numCard = analyze(cards)
  #役判定
  hantei(cards,numCard)
end

#---------------------------------------
#実行編
#---------------------------------------
# 入力を受け取る
inputs = gets.chomp.split("")
cards = inputs

#役を出力
yaku(cards)


