# frozen_string_literal: true

class Game
  attr_reader :players, :interface
  attr_accessor :deck

  def initialize
    @interface = Interface.new
    @players = interface.set_players
    game_round
  end

  def game_round
    null_results
    first_deal
    next_deal until @game_over
    game_result
    more_game
  end

  def first_deal
    game_bet
    interface.shuffling
    2.times do
      deal_card(players[:human_player])
      deal_card(players[:dealer])
    end
    interface.hand_status(@game_over, players)
  end

  def game_bet
    @players.each_value do |player|
      if player.bankrupt?
        @game_over = true
        interface.bankrupt(player)
        exit
      else
        player.bet
        interface.betting(player)
      end
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

  def player_turn(player)
    case interface.player_chose
    when '1'
      deal_card(player)
      @game_over = true if player.hand.full_hand? || player.hand.max_points?
    when '2'
      nil
    when '3'
      @game_over = true
    end
  end

  def dealer_turn(dealer)
    deal_card(dealer) if dealer.hand.points < 17
    @game_over = true if dealer.hand.full_hand?
  end

  def win_reward(player)
    interface.winner(player)
    player.prize
  end

  def more_game
    input = interface.another_game
    case input
    when 1
      game_round
    when 2
      exit
    else
      more_game
    end
  end

  def game_result
    interface.game_over
    interface.hand_status(@game_over, players)
    human_points = players[:human_player].hand.points
    dealer_points = players[:dealer].hand.points

    human_points != dealer_points ? win_check(human_points, dealer_points) : draw_check(human_points)
    interface.bank_message(players)
  end

  def win_check(human_points, dealer_points)
    if (human_points > dealer_points && human_points < 22) || dealer_points > 21
      win_reward(players[:human_player])
    else
      win_reward(players[:dealer])
    end
  end

  def draw_check(human_points)
    human_points == 21 ? interface.draw_win : interface.draw_lose
    players.each_value(&:back_money)
    interface.money_backing
  end

  def null_results
    players.each_value(&:new_hand)
    @deck = Deck.new
    @game_over = false
    system 'clear'
  end
end
