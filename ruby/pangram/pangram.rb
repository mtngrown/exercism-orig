module BookKeeping
  VERSION = 4
end

class Pangram
  def self.pangram?(phrase)
    return false if phrase.empty?
    # phrase.scan(/\A[^a-z]\z/) { return false }
    letters = phrase.each_char.with_object(Hash.new(0)) { |c, h| h[c] += 1 }.keys.map(&:downcase)
    letters.include?(('a'..'z').to_a) ? true : false
    all_letters?(letters) ? true : false
  end

  def self.all_letters?(letters)
    ('a'..'z').each do |c|
      return false unless letters.include? c
    end
    true
  end
end
