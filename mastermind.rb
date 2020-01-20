# frozen_string_literal: true

require_relative 'board'
require_relative 'codebreaker'
require_relative 'codemaker'

# A game manager for the board game "Mastermind"
class Mastermind
  NUM_TURNS = 12

  def initialize
    @board = Board.new
    @codemaker, @codebreaker = choose_roles
  end

  def play
    puts 'The codemaker is creating the code...'
    @board.secret_code = @codemaker.create_secret_code
    NUM_TURNS.times do
      codebreaker_wins = next_turn
      if codebreaker_wins
        puts "You guessed correctly, #{@codebreaker.name}!"
        return
      end
    end
    puts "The codemaker wins! The code was #{@board.secret_code}"
  end

  private

  def next_turn
    puts @board
    guess = @codebreaker.next_guess
    @board.correct_guess?(guess)
  end

  def human_is_codebreaker?
    puts 'Would you like to be the codebreaker? (Y/N)'
    answer = gets.chomp.upcase
    until %w[Y N].include?(answer)
      puts "I don't understand. Would you like to be the codebreaker? (Y/N)"
      answer = gets.chomp.upcase
    end
    answer == 'Y'
  end

  def choose_roles
    puts "Welcome to Mastermind! What's your name?"
    name = gets.chomp
    if human_is_codebreaker?
      puts "Okay #{name}, you're the codebreaker!"
      return [RobotCodeMaker.new('Mr. Roboto'), HumanCodeBreaker.new(name)]
    else
      puts "Sound good #{name}, you get to be the codemaker!"
    end
    [HumanCodeMaker.new(name), RobotCodeBreaker.new('Mr. Roboto')]
  end
end

Mastermind.new.play
