#!/usr/bin/env ruby

class Game
  attr_accessor :first_player, :second_player, :game_players

  def initialize
    @first_player = nil
    @second_player = nil
    @game_players = { :o => "", :x => "" }
    @available_choices = Array(1..9)
    @game_ended = false
    @game_counter = 0
    @game_winner = "TON"
    @arr = []
    @array = []
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
    puts "Gamers welcome to Ruby_Tic_Tac_Toe Game, Please be prepared!"
    puts "Enter First Player's name: "
    @first_player = gets.chomp
    @game_players[:o] = @first_player
    puts "Enter Second Player's name: "
    @second_player = gets.chomp
    @game_players[:x] = @second_player
    sleep 3
    puts "#{@first_player} is O and #{@second_player} is X \n\n"
    sleep 3
    puts "Lets Start the Game!\n\n"
    sleep 3
  end

  def main_game_section
    @game_players.values.each do |current_player|
      draw_game_board
      puts
      if @game_counter < 9
        puts "Hey #{current_player}!, it's your turn"
        puts "Please select a cell available on the board"
        game_logic_section(current_player)
      end
      
    end
  end

  def game_logic_section(current_player)
    loop do
      unless @game_counter < 9
        @game_winner = check_winner
        @game_ended = true if @game_counter <= 9
        return nil
      else
        player_choice = gets.chomp.to_i
        unless @available_choices.include?(player_choice)
          puts "Invalid entry, #{current_player}! please try again later... (your input must be a number between 1 and 9)"
          break
        else
          @game_counter += 1
          @available_choices[player_choice - 1] = @game_players.key(current_player)
          @arr.push(@available_choices[player_choice]) if current_player == @first_player
          @array.push(@available_choices[player_choice]) if current_player == @second_player
        end
      end
    end
  end

  def check_winner
    unless @arr.size == @array.size
      unless @arr.size < @array.size
        puts "#{@first_player} is the Winner!, Your score is #{@arr.size} / #{@available_choices.size} "
      else
        puts "#{@second_player} is the Winner!, Your score is #{@array.size} / #{@available_choices.size} "
      end
    else
      puts "Its a Draw!"
    end
  end

  def start_game
    game_start_section
    main_game_section until @game_ended
    puts
    puts "Now the game Over!"
  end
end

game = Game.new
game.start_game
