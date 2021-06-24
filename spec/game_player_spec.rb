#spec/game_player_spec.rb

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

  it "game class has initialize method" do
    first_player = Player_checks.new("Tongoona", "X")
    expect(first_player.name).to eq("Tongoona")
  end
end