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

end