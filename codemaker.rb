# frozen_string_literal: true

# Base class for all CodeMakers.
class CodeMaker
  VALID_COLORS = %i[A B C D E F].freeze
  def initialize(name)
    @name = name
  end
end

# An AI that can play the role of CodeMaker.
class RobotCodeMaker < CodeMaker
  def initialize(name)
    super
  end

  def create_secret_code
    secret_code = []
    4.times do
      secret_code << VALID_COLORS[rand(6)]
    end
    secret_code
  end
end

# Representation of a human playing the role of CodeMaker.
class HumanCodeMaker < CodeMaker
  def initialize(name)
    super
  end

  def create_secret_code
    puts "#{@name}, what's the secret code?"
    secret_code = gets.chomp.split(' ')
    until valid_secret_code(secret_code)
      puts "#{@name}, that code isn't valid."
      secret_code = gets.chomp.split(' ')
    end
    secret_code
  end

  private

  def valid_secret_code(secret_code)
    secret_code.all? do |peg|
      return false unless VALID_COLORS.include? peg.upcase.to_sym
    end
    secret_code.length == 4
  end
end
