require_relative 'player'
require_relative 'human'
require_relative 'computer'

class Game
  attr_reader :human, :computer

  def initialize
    super
    @human = Human.new
    @computer = Computer.new
  end

  def human_guess
    make = @computer.code_make
    round = 12
    while round > 0
      puts "\n🔁 Round #{round}"
      print '🎯 Enter your guess: '
      guess = @human.play
      feedback = @computer.code_check(guess, make)
      puts "🧠 Feedback from the computer: #{feedback}"

      if feedback['exact'] == 4
        puts "\n🏆 You cracked the code!"
        puts "✅ The correct code was: #{make}"
        @human.score += 1
        return
      end
      round -= 1
    end

    puts "\n❌ You've run out of rounds!"
    puts "🔐 The correct code was: #{make}"
    @computer.score += 1
  end

  def human_make
    print '🔐 Enter your secret code: '
    make = @human.play
    round = 1
    feedback = {}

    while round <= 12
      puts "\n🔁 Round #{round}"
      guess = @computer.code_guess(feedback)
      puts "🤖 Computer's guess: #{guess}"
      feedback = @human.code_check(guess, make)
      puts "🧠 Your feedback: #{feedback}"

      if feedback['exact'] == 4
        puts "\n🤖 Computer cracked your code!"
        @computer.score += 1
        return
      end
      round += 1
    end

    puts "\n🎉 Computer failed to guess your code!"
    puts "✅ The correct code was: #{make}"
    @human.score += 1
  end
end
