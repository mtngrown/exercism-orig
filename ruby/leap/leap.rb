module BookKeeping
  VERSION = 2
end

class Year
  class << self
    def leap? year
      evenly_divisible_by?(year, 4) && not_a_century(year) || evenly_divisible_by?(year, 400)
    end

    private

    def not_a_century year
      !evenly_divisible_by? year, 100
    end

    def evenly_divisible_by? year, divisor
      year.modulo(divisor).zero?
    end
  end
end
