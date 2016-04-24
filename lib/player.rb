require_relative 'game'

class Player
  attr_accessor :hand, :name, :game, :deck, :bank

  def initialize(name = "Player")
    @name  = name
    @hand = []
    @game = nil
    @deck = nil
    @bank = 0
  end


  def add_to_hand(card)
    @hand.concat(card)
  end

  # take card from player @hand[] and put in center_pile
  # select card manually
  def make_move
      display_hand
      puts "select card number"

      begin
        card = select_card_from_hand(gets.chomp.to_i)
        raise "Move not allowed" unless game.allowed?(card)
      rescue
        puts "Not allowed"
        retry
      end

      game.discard(card)
      @hand.delete(card)
  end

  def pay(points)
      @bank += points
  end

  def points
    points = 0

    hand.each do |card|
      points += Card.points(card.value)
    end

    points
  end

  def select_card_from_hand(num)
    hand[num]
  end

  def select_next_suit
    puts "Choose next card rank or just press return"
    next_value = gets.chomp
    return next_value unless next_value == ""
    puts "Choose next card suit"
    gets.chomp
  end

  def display_hand
    puts "_________________"
    puts "Player hand:"
    hand.each_with_index do |card, idx|
      puts "#{idx}: #{card.value} of #{card.suit} "
    end
  end

end

if __FILE__ == $PROGRAM_NAME

end
