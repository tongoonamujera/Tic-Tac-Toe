#!/usr/bin/env ruby

require_relative '../lib/game_player_helper'
require_relative '../lib/game_board.rb'

puts "\u{1F44B} Gamers welcome to Ruby Tic_Tac_Toe Game, Please be prepared!"

def draw_game_board(available_choices)
  puts '+---+---+---+'
  puts "| #{available_choices[0]} | #{available_choices[1]} | #{available_choices[2]} |"
  puts '+---+---+---+'
  puts "| #{available_choices[3]} | #{available_choices[4]} | #{available_choices[5]} |"
  puts '+---+---+---+'
  puts "| #{available_choices[6]} | #{available_choices[7]} | #{available_choices[8]} |"
  puts '+---+---+---+'
end

# def check_vowels(strin)
#   counter = 0
#   vowels = %w(a e i o u)
#   str_chars = strin.chars
#   str_chars.each do |char|
#     vowels.each do |vowel|
#       if char == vowel.upcase
#         counter += 1
#       else
#         puts 'no vowel'
#       end
#       counter
#     end
#   end
#   true if counter >= 1
# end

def check_name_validity?(name)
  unless  (name.size > 2 && name.size < 12) && name.match(/^[a-z]+$/i) #&& check_vowels(name)
    puts "Wrong name characters (characters must not contain numbers and must be between 2 and 12)"
    name = gets.chomp.upcase
  else
    true
    name
  end
end

def game_players
  puts 'Hey first player!, please enter your name: '
  first_player = gets.chomp.upcase
  first_player until check_name_validity?(first_player) 
  puts 'Hey second player!, please enter your name: '
  second_player = gets.chomp.upcase
  second_player until check_name_validity?(second_player) 
  [first_player, second_player]
end

def assign_player_symbols(first_player, second_player)
  puts "Welcome Players!"
  puts "#{first_player.name}, Your symbol is #{first_player.player_symbol} & #{second_player.name}, Your symbol is #{second_player.player_symbol}"
end

def places_validation(choice, score_board)
  available_choices = Array(1..9)
  loop do
    break if available_choices.include?(choice) && !score_board[choice - 1].is_a?(String)

    puts "Please enter  a valid number" unless available_choices.include?(choice)
    puts "Its already taken!, Please choose another number on the board" if score_board[choice - 1].is_a?(String)
    choice = gets.chomp().to_i
  end
  choice
end

loop do
  game_board = Game_board.new
  first_player_name, second_player_name = game_players
  first_player = Player_checks.new(first_player_name, "O")
  second_player = Player_checks.new(second_player_name, "X")
  assign_player_symbols(first_player, second_player)
  2.times {puts}
  sleep 1

  draw_game_board(game_board.available_choices)
  current_player = first_player
  sleep 1

  loop do
    puts "Now its you turn to play #{current_player.name} "
    choice = gets.chomp.to_i
    choice = places_validation(choice, game_board.available_choices)

    game_board.update_game_board(current_player, choice, first_player, second_player)

    if game_board.winner?
      draw_game_board(game_board.available_choices)
      puts "'Celebrate!' #{current_player.name}, You won the game! \n"
      break
    elsif game_board.draw?
      display_board(game_board.available_choices)
      puts "Tie game! — Game over \n"
      break
    end
    draw_game_board(game_board.available_choices)
    current_player = first_player.switch_player(current_player, second_player)
  end
  break
end