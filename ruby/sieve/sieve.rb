class Sieve
  attr_reader :n

  def initialize(n)
    @n = n
  end

  # Disclaimer: This is from rosetta code. It's pretty
  # nice, definitely has a much more Ruby flavor than
  # the usual indexed version.
  def primes
    primes = [nil, nil, *2..n]
    (2..Math.sqrt(n)).each do |i|
      (i**2..n).step(i) { |m| primes[m] = nil } if primes[i]
    end
    primes.compact
  end
end

module BookKeeping
  VERSION = 1
end
