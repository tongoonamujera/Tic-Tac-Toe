
class Player_checks
  attr_accessor :name, :player_symbol
  def initialize(name, player_symbol)
    @name = name
    @player_symbol = player_symbol
    @counter = 0
  end

  def switch_player(current_player, opponent_player)
    current_player == self ? opponent_player : self
  end
end


