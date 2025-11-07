class Player
  attr_accessor :score

  def initialize
    @score = 0
  end

  def code_check(guess, make)
    checker = { 'exact' => 0, 'valid' => 0, 'none' => 0 }
    guess.each_with_index do |v, i|
      if make.include?(v) && make[i] == v
        checker['exact'] += 1
      elsif make.include?(v)
        checker['valid'] += 1
      else
        checker['none'] += 1
      end
    end
    checker
  end
end
