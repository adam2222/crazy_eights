require "rspec"
require 'deck'


describe '#initialize' do
  subject(:new_deck) { Deck.new }

  it "creates a deck of 52 cards" do
    expect(new_deck.count).to eq(52)
  end

  it "creates a deck of Card objects" do
    expect(new_deck.cards[0]).to be_a(Card)
  end

end

describe '#count' do
  subject(:new_deck) { Deck.new }

  it "returns the number of cards left in the deck" do
    expect(new_deck).to respond_to(:count)
  end

end
