class Complement
  def self.of_dna dna
    dna.chars.map do |c|
      case c
      when 'G' then 'C'
      when 'C' then 'G'
      when 'T' then 'A'
      when 'A' then 'U'
      else
        return ''
      end
    end.join
  end
end

module BookKeeping
  VERSION = 4
end
