module BookKeeping
  VERSION = 3
end

class Squares
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def sum
    @sum ||= (1..n).reduce(:+)
  end

  def square_of_sum
    return 0 if n.zero?
    sum * sum
  end

  def sum_of_squares
    return 0 if n.zero?
    (1..n).reduce(0) { |a, e| a += e * e }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
