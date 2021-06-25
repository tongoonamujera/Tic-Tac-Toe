class Game_board
  attr_accessor :available_choices

  def initialize()
    @available_choices = Array(1..9)
    @winning_outcomes = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [0, 4, 8],
    ]
  end

  def draw?
    @available_choices.all? { |x| x.is_a?(String) }
  end

  def winner?
    @winning_outcomes.any? do |sub_array|
      sub_array.all? { |index| @available_choices[index] == 'X'} || sub_array.all? { |index| @available_choices[index] == 'O' }
    end
  end

  def update_game_board(current_player, choice, first_player, second_player)
    if current_player == first_player
      @available_choices[choice - 1] = first_player.player_symbol
    else
      @available_choices[choice - 1] = second_player.player_symbol
    end
  end
end