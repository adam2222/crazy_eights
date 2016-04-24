require "rspec"
require 'game'

describe "Game" do
  describe '#initialize' do
    subject(:game) { Game.new }

    it "creates a default game with a deck and 2 players" do
      expect(game.deck).to be_a(Deck)
      expect(game.players[0]).to be_a(Player)
      expect (game.players[0].name).to eq("player_1")
    end

  end
end
