require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/human'
require_relative 'lib/computer'

game = Game.new

loop do
  puts "\n🎲 New game begins!"
  puts 'Choose your role:'
  puts '👉 0 - Code Breaker (you guess)'
  puts '👉 1 - Code Maker (computer guesses)'
  print 'Your choice: '
  role = gets.chomp

  if role == '0'
    game.human_guess
  else
    game.human_make
  end

  puts "\n📊 Current Scores:"
  puts "🧑 Human: #{game.human.score}"
  puts "🤖 Computer: #{game.computer.score}"

  puts "\n🔁 Play again? (y/n)"
  print 'Your answer: '
  continue = gets.chomp.downcase
  break unless continue == 'y'
end

puts "\n👋 Thanks for playing"
