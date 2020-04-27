# frozen_string_literal: true

module Menu

  def welcome
    puts 'Hello! This is a Black Jack game!'
    puts 'What is your name?'
  end

  def shuffling
    puts 'Cards are shuffling, please wait!'
    sleep 1
  end

  def betting(player)
    puts "#{player.name}, you have #{player.bank}$ left in your pocket!"
  end

  def hand_status(player)
    puts "Cards in #{player.name} hand:"
  end

  def more_game

  end

  def money_backing

  end

  def bankrupt

  end

  def winner

  end

  def loser

  end

  def draw_win

  end

  def draw_lose

  end

  def wrong_input

  end

  def game_over

  end

  def player_chose

  end

  def hand_points(player)
    puts "Total points: #{player.hand.count_points}"
  end

  def end_game

  end

  def dealer_message

  end
end