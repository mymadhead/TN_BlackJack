# frozen_string_literal: true

class Deck
  attr_reader :cards

  def initialize
    @cards = Card::DECK.map { |card| Card.new(card[0], card[1]) }.shuffle
  end

  def full_deck?
    cards.count == 52
  end
end