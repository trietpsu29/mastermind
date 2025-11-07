require_relative 'player'

class Human < Player
  def play
    guess = gets.chomp
    guess.split(' ')
  end
end
