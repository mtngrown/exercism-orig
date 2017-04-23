module BookKeeping
  VERSION = 2
end

class Year
  class << self
    def leap? year
      mod_zero?(year, 400) || non_century?(year)
    end

    private

    def non_century? year
      mod_zero?(year, 4) && !mod_zero?(year, 100)
    end

    def mod_zero? year, divisor
      (year % divisor).zero?
    end
  end
end
