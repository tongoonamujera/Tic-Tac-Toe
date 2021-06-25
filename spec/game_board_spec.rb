#spec/game_board_spec.rb

require_relative "../lib/game_board.rb"



RSpec.describe Game_board do

  it "it has a getter and a setter for name and symbol attributes" do
    game = Game_board.new
    expect(game.available_choices).to eq(Array(1..9))
  end
end