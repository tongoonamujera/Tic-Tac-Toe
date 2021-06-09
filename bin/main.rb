#!/usr/bin/env ruby

class Game
  attr_accessor :first_player, :second_player, :players

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
    @players[O] = @first_player
    puts "Enter Second Player's name: "
    @second_player = gets.chomp()
    @players[X] = @second_player
    sleep 3
    puts "#{@first_player} is O and #{@second_player} is X"
    sleep 3
    puts 
    puts "Lets Start the Game!"
    puts
    sleep 3
  end
end
