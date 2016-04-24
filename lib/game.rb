require 'byebug'
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require 'io/console'

class Game
attr_accessor :deck, :players, :discard_pile, :allowed_moves

  def initialize(players, deck = Deck.new)
    @deck = deck
    players.each { |player| player.game = self }
    @players = players.shuffle

    @discard_pile = []
  end

  def play
    until end_of_round?
      i = 0
      current_player = players[i % number_of_players]
      i += 1

      deal
      flip_top_card
      current_player.make_move
      current_player.points
    end

  end

  def number_of_players
    @players.count
  end

  def deal
    @players.each do |player|
      player.add_to_hand(deck.take(8))
      deck.shuffle
    end
  end

  def discard(card)
    discard_pile << card
  end

  def flip_top_card
    discard_pile.concat(deck.take(1))
    display_discard_pile
  end

  def display_discard_pile
    puts "_________________"
    puts "Discard pile:"
    top_card = discard_pile.last
    puts "#{top_card.value} of #{top_card.suit} "
  end


  def allowed?(card)
    allowed_value = discard_pile.last.value
    allowed_suit = discard_pile.last.suit

    card.value == :eight || card.value == allowed_value || card.suit == allowed_suit
  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("1")
  player2 = Player.new("2")
  game = Game.new([player1, player2])
  game.deal
  game.flip_top_card
  player1.make_move
  player1.points

end
