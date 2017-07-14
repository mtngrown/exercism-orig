class Grains
  @@grains = nil

  def self.grains
    @@grains ||= (0..63).to_a.map { |i| 2**i }
  end

  def self.square(n)
    raise ArgumentError unless (1..64).include?(n)
    grains[n-1]
  end

  def self.total
    grains.sum
  end
end

module BookKeeping
  VERSION = 1
end
