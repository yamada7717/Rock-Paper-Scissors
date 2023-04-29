puts "じゃんけん..."

class Janken
  #外部から参照・更新できるようにする
  attr_accessor :player_hand, :program_hand

  def initialize(player_hand, program_hand)
      @player_hand = player_hand
      @program_hand = program_hand
  end

  def janken
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    @player_hand = gets.to_i
    @program_hand = rand(3)

    if player_hand == 3
      puts "戦わないが選択されました。\nゲームを終了します。"
      puts "----------------------------------------------"
      exit
    end

    jankens = ["グー","チョキ","パー"]
    puts "ホイ！"
    puts "-------------------------------------------------"
    puts "あなた:#{jankens[@player_hand]}を出しました"
    puts "相手:#{jankens[@program_hand]}を出しました"
    puts "-------------------------------------------------"

    if @player_hand == @program_hand
      puts "あいこで"
      return true

    elsif @player_hand == 0 && @program_hand == 1 ||
          @player_hand == 1 && @program_hand == 2 ||
          @player_hand == 2 && @program_hand == 0
      puts "あなたの勝ちです！"
      @winner = "player"
      #あっちむいてホイ
      direction

    elsif @program_hand == 0 && @player_hand == 1 ||
          @program_hand == 1 && @player_hand == 2 ||
          @program_hand == 2 && @player_hand == 0
      puts "あなたの負けです！"
      @winner = "program"
      #あっちむいてホイ
      direction

    else
      puts "ゲーム終了"
      exit
    end
  end

  #あっちむいてホイ
  def direction
    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    @player_hand = gets.to_i
    @program_hand = rand(4)

    directions = ["上","下","左","右"]
    puts "ホイ！"
    puts "-------------------------------------------------"
    puts "あなた:#{directions[@player_hand]}"
    puts "相手:#{directions[@program_hand]}"
    puts "-------------------------------------------------"

    if @program_hand == @player_hand && @winner == "program"
      puts "あなたの負けです"
      return false

    elsif @player_hand == @program_hand && @winner == "player"
      puts "あなたの勝ちです"
      return false

    else
      puts "じゃんけん..."
      janken
    end
  end
#クラスの終了
end

#ゲームループ
next_game = true
while next_game
  game = Janken.new(@program_hand, @player_hand)
  next_game = game.janken
end
