class Phrase
  attr_accessor :words

  def initialize(phrase)
    words = phrase.gsub(/('\s|\s')/, ' ')
    @words = words.split(/[\s,:!&@$^%\.]/).reject { |w| w.nil? || w.empty? }
  end

  def word_count
    words.each.with_object(Hash.new(0)) { |w, h| h[w.downcase] += 1 }
  end
end

module BookKeeping
  VERSION = 1
end
