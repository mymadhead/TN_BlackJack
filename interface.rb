# frozen_string_literal: true

class Interface
  include Menu

  def set_players
    welcome
    { human_player: Player.new(gets.chomp), dealer: Player.new }
  end

  def new_game
    game_bet
  end

  def another_game
    another_game_message
    gets.to_i
  end

  def player_chose
    chose_action
    gets.to_i
  end

  def hand_status(game_over, players)
    open_hand(players[:human_player])
    game_over ? open_hand(players[:dealer]) : hide_hand(players[:dealer])
  end

  def open_hand(player)
    hand_status_message(player)
    puts player.hand.cards.map { |card| "#{card.rank}#{card.suite}" }.join(', ')
    hand_points_message(player)
  end

  def hide_hand(player)
    hand_status_message(player)
    puts '*** ' * player.hand.cards.size
  end
end
