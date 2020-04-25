# frozen_string_literal: true

class Game
  attr_reader :players, :interface
  attr_accessor :deck

  def initialize
    @interface = Interface.new
    @players = interface.set_players
  end

  def game_round

  end

  def first_deal

  end

  def next_deal

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

  def null_results

  end

end