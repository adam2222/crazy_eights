require 'rspec'
require 'deck'


describe '#initialize' do
  subject(:new_deck) { Deck.new }
  let(:suits) {[:hearts, :spades, :clubs, :diamonds]}

  it "creates a deck of 52 cards" do
    expect(new_deck.count).to eq(52)
  end

  it "creates a deck of Card objects" do
    expect(new_deck.cards[0]).to be_a(Card)
    expect(suits).to include(new_deck.cards[0].suit)
  end


end

describe '#count' do
  subject(:new_deck) { Deck.new }

  it "returns the number of cards left in the deck" do
    expect(new_deck).to respond_to(:count)
  end

end

describe  '#take(n)' do
  subject(:take_n) { Deck.new.take(2) }

  it 'returns an array of n cards from the deck' do
    expect(take_n).to be_an(Array)

    expect(take_n.count).to eq(2)
  end

end
