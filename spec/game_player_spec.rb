#spec/game_player_spec.rb

require_relative "../lib/game_board.rb"

require_relative "../lib/game_player_helper.rb"


RSpec.describe Player_checks do

  it "it has a getter and a setter for name and symbol attributes" do
    first_player = Player_checks.new("Tongoona", "X")
    first_player.player_symbol = 'X'
    expect(first_player.name).to eq("Tongoona")
    expect(first_player.player_symbol).to eq("X")
  end

  it "game class has initialize method" do
    first_player = Player_checks.new("Tongoona", "X")
    expect(first_player.name).to eq("Tongoona")
  end

  it "it switches the current player to a new player" do
    first_player = Player_checks.new("Tongoona", "X")
    second_player = Player_checks.new("Mujera", "O")
    expect(first_player.switch_player(first_player, second_player)).to eq(second_player)
  end
end

RSpec.describe Game_board do

  it "it has a getter and a setter for available_choices" do
    game = Game_board.new
    expect(game.available_choices).to eq(Array(1..9))
  end
end