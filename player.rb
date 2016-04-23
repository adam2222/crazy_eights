class Player
  attr_accessor :hand

  def initialize(name = "Player#{n}")
    @name  = name
    @hand = []
  end

  def points
    points = 0

    hand.each do |card|
      points += Card.points(card.value)
    end

    points
  end

  def make_move(card)
    # take card from player @hand[] and put in center_pile
      # select card manually
      raise "Move not allowed" unless game.allowed?(card)

      game.center_pile << card
     @hand.reject!(card)
  end

  def choose_card
    puts "Choose next card rank or just press return"
    next_value = gets.chomp
    return next_value unless next_value == ""
    puts "Choose next card suit"
    gets.chomp
  end

  def display_hand
    p hand
  end

end
