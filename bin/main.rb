#!/usr/bin/env ruby

class Game
  attr_accessor :first_player, :second_player, :game_players

  def initialize
    @first_player = nil
    @second_player = nil
    @players = {}
    @available_choices = Array(1..9)
    @game_ended = false
    @game_counter = 0
    @game_winner = "TON"
  end

  def draw_game_board
    puts '+---+---+---+'
    puts "| #{@available_choices[0]} | #{@available_choices[1]} | #{@available_choices[2]} |"
    puts '+---+---+---+'
    puts "| #{@available_choices[3]} | #{@available_choices[4]} | #{@available_choices[5]} |"
    puts '+---+---+---+'
    puts "| #{@available_choices[6]} | #{@available_choices[7]} | #{@available_choices[8]} |"
    puts '+---+---+---+'
  end

  def game_start_section
    puts
    puts "Gamers welcome to Ruby_Tic_Tac_Toe Game, Please be prepared!"
    puts 
    puts "Enter First Player's name: "
    @first_player = gets.chomp()
    @game_players[O] = @first_player
    puts "Enter Second Player's name: "
    @second_player = gets.chomp()
    @game_players[X] = @second_player
    sleep 3
    puts "#{@first_player} is O and #{@second_player} is X"
    sleep 3
    puts 
    puts "Lets Start the Game!"
    puts
    sleep 3
  end

  def main_game_section
    @game_players.values.each do |current_player|
      draw_game_board
      puts
      puts "Hey #{current_player}!, it's your turn"
      puts "Please select a cell available on the board"
      game_logic_section(current_player)
    end
  end

  def game_logic_section(current_player)
    loop do
      unless @game_counter < 9
        @game_winner = @first_player
        @game_ended = true
        return nil
      else
        player_choice = gets.chomp.to_i
        unless @available_choices.include?(player_choice)
          @game_counter += 1
          @available_choices[player_choice - 1] = @game_players.key(current_player)
          break
        else
          puts "Invalid entry, #{current_player}! please try again... (your input must be a number between 1 and 9)"
        end
      end
    end
  end

  def start_game
    game_start_section
    main_game_section until @game_ended
    unless @game_winner == "TON"
      puts "#{@game_winner} is winner! "
    else
      puts "TON is the winner"
    end
    puts
    puts "Its game Over!"
  end
end

game = Game.new
game.start_game
