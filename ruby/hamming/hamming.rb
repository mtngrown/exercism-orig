class Hamming
  class << self
    def compute str1, str2
      raise ArgumentError unless str1.length == str2.length
      return 0 if str1 == str2
      # wikipedia ftw
      str1.chars.zip(str2.chars).count { |l, r| l != r }
    end
  end
end

module BookKeeping
  VERSION = 3
end
