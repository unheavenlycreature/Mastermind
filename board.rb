# frozen_string_literal: true

# A representation of a Mastermind board.
class Board
  attr_accessor :secret_code

  def initialize
    @secret_code = []
    @guesses = []
    @clues = []
  end

  def correct_guess?(guess)
    guess.map! { |peg| peg.upcase.to_sym }
    return true if guess == @secret_code

    @guesses << guess
    add_clues(guess)
    false
  end

  def to_s
    board = ''
    @guesses.each_with_index do |guess, index|
      board += "#{index + 1}. Guess: #{guess},  clues: #{@clues[index]}\n"
    end
    board
  end

  private

  def add_clues(saved_guess)
    secret_code_clone = @secret_code.clone
    guess_clone = saved_guess.clone
    clues, remaining = add_correct_clues(secret_code_clone, guess_clone)
    clues = add_color_matches(secret_code_clone, remaining, clues)
    @clues << clues.shuffle
  end

  def add_correct_clues(secret_code, guess)
    clues = []
    remaining = Hash.new(0)
    until guess.empty?
      secret_code_peg = secret_code.shift
      guess_peg = guess.shift
      if secret_code_peg == guess_peg
        clues << :B
      else
        secret_code << secret_code_peg
        remaining[guess_peg] += 1
      end
    end
    [clues, remaining]
  end

  def add_color_matches(secret_code, remaining, clues)
    secret_code.each do |peg|
      if remaining[peg].positive?
        clues << :W
        remaining[peg] -= 1
      end
    end
    clues
  end
end
