
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require 'io/console'

class Game
attr_accessor :deck, :center_pile, :allowed_moves

  def initialize(deck = Deck.new, *players)
    @deck = deck
    @players = Players
  end

  def number_of_players
    @players.count
  end

  def deal(@players)
    @players.each do |player|
      player.hand << deck.take(8)
      deck.shuffle
    end
  end

  def flip_top_card(deck)
    center_pile << deck.take(1)
    puts "Center pile: #{print center_pile}"
  end

  def allowed?(card)
    allowed_value = center_pile.last.value
    allowed_suit = center_pile.last.suit

    card.value == :eight || card.value == allowed_value || card.suit == allowed_suit
  end



end
