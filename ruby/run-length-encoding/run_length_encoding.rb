class RunLengthEncoding
  def self.encode string
    return string if string.empty?

    string.each_char.with_object(String.new) do |c, s|
      count = 0
      current_char = c
    end
  end

  def self.decode string
    return string if string.empty?
  end
end
