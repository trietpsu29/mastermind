require_relative 'player'

class Computer < Player
  def initialize
    super
    @colors = %w[red green blue black white yellow]
    @memo = []
  end

  def code_guess(feedback)
    guess = []
    if feedback.empty? || feedback['none'] > 0
      @memo.last.each { |v| @colors.delete(v) } if feedback['none'] == 4
      guess = @colors.sample(4)
    else
      loop do
        guess = @memo.last.sample(4)
        break unless @memo.include?(guess)
      end
    end

    @memo.push(guess)
    guess
  end

  def code_make
    Array.new(4) { @colors.sample }
  end
end
