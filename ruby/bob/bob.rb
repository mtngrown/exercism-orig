#!/usr/bin/env ruby

class String
  def allcaps?
    self == self.upcase
  end
end

class Bob
  class << self
    def hey you
      return fine if you.empty? || you =~ /\A\s+\z/
      return chillout if you.allcaps?
      return sure if you.end_with? '?'
      whatever
    end

    def fine
      'Fine. Be that way!'
    end

    def sure
      "Sure."
    end

    def chillout
      "Whoa, chill out!"
    end

    def whatever
      "Whatever."
    end
  end
end
