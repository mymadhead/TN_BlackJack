# frozen_string_literal: true

class Card

  DECK = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].product(%W[\u{2665} \u{2666} \u{2663} \u{2660}]).freeze

  attr_reader :suite, :rank

  def initialize(suite, rank)
    @suite = suite
    @rank = rank
  end

  def ace?
    rank == 'Ace'
  end
end