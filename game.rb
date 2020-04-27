# frozen_string_literal: true

class Game
  attr_reader :players, :interface
  attr_accessor :deck

  def initialize
    @interface = Interface.new
    @players = interface.set_players
  end

  def game_round
    null_results
    first_deal
    next_deal until @game_over
    game_result
    more_game
  end

  def first_deal
    2.times do
      deal_card(players[:human_player])
      deal_card(players[:dealer])
    end
  end

  def deal_card(player)
    card = @deck.cards.delete(@deck.cards.sample)
    player.add_card(card)
  end

  def next_deal
    player_turn(players[:human_player])
    dealer_turn(players[:dealer])
  end

  def game_bet

  end

  def player_turn

  end

  def dealer_turn

  end

  def win_check

  end

  def draw_check

  end

  def game_over

  end

  def win_reward

  end

  def more_game

  end

  def game_result

  end

  def null_results

  end

end