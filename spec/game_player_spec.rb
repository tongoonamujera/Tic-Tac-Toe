#spec/game_player_spec.rb

require_relative "../lib/game_board.rb"

require_relative "../lib/game_player_helper.rb"


RSpec.describe Player_checks do

  first_player = Player_checks.new("Tongoona", "X")
  second_player = Player_checks.new("Mujera", "O")

  #testing if the class has getters and setters
  it "it has a getter and a setter for name and symbol attributes" do
    first_player.player_symbol = 'X'
    expect(first_player.name).to eq("Tongoona")
    expect(first_player.player_symbol).to eq("X")
  end

  # initialize method tests
  it "Player_checks class has initialize method" do
    expect(first_player.name).to eq("Tongoona")
  end

  #switch_player method tests
  it "it switches the current player to a new player if current player is self" do
    expect(first_player.switch_player(first_player, second_player)).to eq(second_player)
  end

  it "it does not switch the current player to a new player if current player is the opponent player" do
    expect(first_player.switch_player(second_player, first_player)).to eq(first_player)
  end
end

RSpec.describe Game_board do

  game = Game_board.new
  first_player = Player_checks.new("Tongoona", "X")
  second_player = Player_checks.new("Mujera", "O")
  current_player = first_player

  #testing for getters and setters
  it "it has a getter and a setter for available_choices" do
    expect(game.available_choices).to eq(Array(1..9))
  end

  #checking for initialize method
  it 'has an initialize method' do
    expect(game.available_choices).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  #draw? method tests

  it 'Must return false if all elements are numeric' do
    expect(game.draw?).to eq(false)
  end

  it 'Must return true when all elements are string' do
    game.available_choices = %w[O X O X O X O X O]
    expect(game.draw?).to eq(true)
  end

  #winner?method tests
  it 'Must return true if there is no combination in available_choices with the same symbol' do
    game.available_choices = %w[O X O X X X O O X]
    expect(!game.winner?).to be(false)
  end

  it 'Must return true if there is combination in available_choices with all the same symbol' do
    game.available_choices = %w[O X O X X X O O X]
    expect(game.winner?).to be(true)
  end

  #update game board test
  it 'Must update board after player enter token position' do
    game.update_game_board(current_player, 1, first_player, second_player)
    expect(game.available_choices[0]).to eq('X')
  end
end