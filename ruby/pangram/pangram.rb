module BookKeeping
  VERSION = 4
end

class Pangram
  def self.pangram?(phrase)
    return false if phrase.empty?
    full_alphabet?(get_letters(phrase)) ? true : false
  end

  def self.full_alphabet?(letters)
    ('a'..'z').each { |c| return false unless letters.include? c }
    true
  end

  def self.get_letters phrase
    phrase.each_char.with_object(Hash.new(0)) { |c, h| h[c] += 1 }.keys.map(&:downcase)
  end
end
