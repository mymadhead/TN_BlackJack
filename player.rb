# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :bank, :hand

  def initialize(name = 'Dealer')
    @name = name
    @bank = 100
  end

  def new_hand
    @hand = Hand.new
  end

  def add_card(card)
    hand.cards << card
  end

  def bankrupt?
    @bank <= 0
  end

  def bet
    self.bank -= 10
  end

  def back_money
    self.bank += 10
  end

  def prize
    self.bank += 20
  end
end