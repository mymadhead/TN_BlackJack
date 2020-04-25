# frozen_string_literal: true

class Interface
  include Menu

  def set_players
    { human_player: Player.new(gets.chomp), dealer: Player.new }
  end

  def new_game
    game_bet
  end

end