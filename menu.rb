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

  def hand_status_message(player)
    puts "Cards in #{player.name} hand:"
  end

  def money_backing
    puts 'Players get their 10$ back.'
  end

  def bankrupt(player)
    puts "Sorry #{player.name}! You are a bankrupt!"
  end

  def winner(player)
    puts "Congratulations #{player.name}! You have won!"
    puts "#{player.name}, you receive your $20 prize"
  end

  def loser
    puts "#{player.name}! You lose! Try again!"
  end

  def draw_win
    puts 'Congratulations! You both win!'
  end

  def draw_lose
    puts 'Oops! You both lose!'
  end

  def wrong_input
    puts 'Wrong input!'
  end

  def game_over
    puts 'The game is over. Try again!'
  end

  def chose_action
    puts 'Chose your turn:'
    puts 'Type 1, take new card'
    puts 'Type 2, to pass'
    puts 'Type 3, to open hands'
  end

  def another_game_message
    puts 'One more game?'
    puts '1. Yes  2. No'
  end

  def hand_points_message(player)
    puts "Total points: #{player.hand.count_points}"
  end

  def bank_message(players)
    puts "Player's total: $#{players[:human_player].bank}$. Dealer's total: $#{players[:dealer].bank}$"
  end
end
