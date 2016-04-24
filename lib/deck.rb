require_relative 'card'

class Deck
  attr_accessor :cards, :shuffle

  def initialize(cards = Deck.all_cards)
    @cards = cards.shuffle
  end

  def self.all_cards
    deck = []

    Card.suits.each do |suit|
      Card.values.each do |value|
        deck << Card.new(value, suit)
      end
    end

    deck
  end

  def count
    @cards.count
  end

  def take(n)
    self.cards.shift(n)
  end

  def shuffle
      @cards.shuffle
  end

  def refill_deck(discard_pile)
    cards = game.discard_pile.shuffle
    game.discard_pile = [] 
  end

end
