require 'byebug'
require_relative 'deck'
require_relative 'card'
require_relative 'player'
require 'io/console'

class Game
attr_accessor :deck, :players, :discard_pile, :allowed_moves

  def initialize(players, deck = Deck.new)
    @deck = deck

    players.each do |player|
      player.game = self
      player.deck = @deck
    end
    @players = players.shuffle

    @discard_pile = []
    @move_count = 0
  end

  def play
    until won_game?
      deal
      flip_top_card
      until end_of_round?
        display_discard_pile
        play_round
      end

      puts "_________________"
      winner = round_winner.first
      puts "Round winner is #{winner.name}"
      players.each { |player| winner.pay(player.points) }
      puts "_________________"
      puts "Bank totals:"
      players.each { |player| puts "#{player.name}: #{player.bank}" }
    end
    puts "_________________"
    puts "Winner: #{game_winner.first.name}"
  end


  def play_round
    current_player = players[@move_count % number_of_players]
    @move_count += 1
    puts "#{current_player.name}'s turn"

    while no_moves_available?(current_player.hand)
      puts "No moves available.  Card drawn from deck:"
      card = deck.take(1)
      current_player.add_to_hand(card)
      puts "#{card.first.value} of #{card.first.suit}"
    end

    current_player.make_move
  end

  def round_winner
    players.select { |player| player.hand.empty? }
  end

  def won_game?
    winning_number = 50 * number_of_players
    players.any? { |player| player.bank > winning_number }
  end

  def game_winner
    winning_number = 50 * number_of_players
    players.select { |player| player.bank > winning_number }
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
  end

  def display_discard_pile
    puts "_________________"
    puts "Discard pile:"
    top_card = discard_pile.last
    puts "#{top_card.value} of #{top_card.suit} "
    puts "_________________"
  end


  def allowed?(card)
    allowed_value = discard_pile.last.value
    allowed_suit = discard_pile.last.suit

    card.value == :eight || card.value == allowed_value || card.suit == allowed_suit
  end

  def no_moves_available?(hand)
    hand.each { |card| return false if allowed?(card) }
    true
  end

  def end_of_round?
    players.any? { |player| player.hand.empty? }
  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Player1")
  player2 = Player.new("Player2")
  game = Game.new([player1, player2])
  # byebug
  game.play


end
