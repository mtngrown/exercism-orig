class Raindrops
  class << self
    def convert n
      result = "#{three(n)}#{five(n)}#{seven(n)}"
      result.empty? ? n.to_s : result
    end

    def three n
      n.modulo(3).zero? ? 'Pling' : ''
    end

    def five n
      n.modulo(5).zero? ? 'Plang' : ''
    end

    def seven n
      n.modulo(7).zero? ? 'Plong' : ''
    end
  end
end

module BookKeeping
  VERSION = 3
end
