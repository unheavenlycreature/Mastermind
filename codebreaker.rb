# frozen_string_literal: true

# Base class for all CodeBreakers.
class CodeBreaker
  VALID_COLORS = %i[A B C D E F].freeze
  def initialize(name)
    @name = name
  end
end

# An AI that can play the role of CodeBreaker.
class RobotCodeBreaker < CodeBreaker
  def initialize(name)
    super
  end

  def next_guess
    puts "#{@name} is thinking..."
    sleep 3
    guess = []
    4.times do
      guess << VALID_COLORS[rand(5)]
    end
    guess
  end
end

# Representation of a human playing the role of CodeBreaker.
class HumanCodeBreaker < CodeBreaker
  def initialize(name)
    super
  end

  def next_guess
    guess = guess_prompt
    until valid_guess?(guess)
      puts "#{@name}, you need to provide four pegs."
      puts "Valid pegs are #{VALID_COLORS}"
      guess = guess_prompt
    end
    guess.split(' ')
  end

  private

  def guess_prompt
    puts "#{@name}, what is your guess?"
    gets.chomp
  end

  def valid_guess?(guess)
    pegs = guess.split(' ')
    return false if pegs.length != 4

    pegs.each do |peg|
      return false unless VALID_COLORS.include? peg.upcase.to_sym
    end
    true
  end
end
