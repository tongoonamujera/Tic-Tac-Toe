module Player_helper
  class Player_checks
    attr_accessor :name, :game_over
    def initialize
      @name = ""
      @game_over = false
      @player = ""
      @vowels = %w(a e i o u)
      @counter = 0
    end

    def check_name_validity?(name)
      @name = name
      unless  (@name.size > 2 && @name.size < 12) && @name.match(/^[a-z]+$/i) && check_vowels(name)
        false
      else
        true
      end
    end

    def check_vowels(strin)
      str_chars = strin.chars
      str_chars.each do |char|
        @vowels.each do |vowel|
          if char == vowel
            @counter += 1
          end
        end
      end
      @counter
      true if @counter >= 1
    end
  end
end

include Player_helper
player = Player_checks.new
puts "hey Whats your name: "
name = gets.chomp
puts player.check_name_validity?(name)

