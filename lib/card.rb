
class Card
  attr_accessor :value, :suit

  VALUES = {
    two:    2
    three:  3
    four:   4
    five:   5
    six:    6
    seven:  7
    eight:  50
    nine:   9
    ten:    10
    jack:   10
    queen:  10
    king:   10
    ace:    1
  }

  SUITS = [:hearts, :spades, :clubs, :diamonds]

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def self.values
    VALUES.keys
  end

  def self.suits
    SUITS
  end

  def self.points(value)
    VALUES[value]
  end

end
