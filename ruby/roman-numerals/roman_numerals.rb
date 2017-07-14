class Integer
  def to_roman
    return 'MMMMM++' if self > 4000
    temp = self
    numeral = ""

    if self >= 1000
      (1000..temp).step(1000) do |n|
        numeral << 'M'
        temp -= 1000
      end
      numeral << temp.to_roman

    elsif temp >= 900 && temp < 1000
      numeral << 'CM'
      temp -= 900
      numeral << temp.to_roman

    elsif temp >= 500 && temp < 900
      numeral << 'D'
      temp -= 500
      numeral << temp.to_roman

    elsif temp >= 400 && temp < 500
      numeral << 'CD'
      temp -= 400
      numeral << temp.to_roman

    elsif temp >= 100 and temp < 300
      (100..temp).step(100).each do |n|
        numeral << 'C'
        temp -= 100
      end
      numeral << temp.to_roman

    elsif temp >= 90 && temp < 100
      numeral << 'XC'
      temp -= 90
      numeral << temp.to_roman

    elsif temp >= 60 && temp < 90
      numeral << 'L'
      temp -= 50
      numeral << temp.to_roman

    elsif temp >= 50 && temp < 60
      numeral << 'L'
      temp -= 50
      numeral << temp.to_roman

    elsif temp > 40 && temp < 50
      numeral << 'XL'
      temp -= 40
      numeral << temp.to_roman

    elsif temp < 40 && temp >= 10
      (10..temp).step(10) do |n|
        numeral << 'X'
        temp -= 10
      end
      numeral << temp.to_roman

    elsif temp == 9
      numeral << 'IX'

    elsif temp >= 5 && temp < 9
      numeral << 'V'
      (6..temp).each { numeral << 'I' }

    elsif temp == 4
      numeral << 'IV'

    elsif temp < 4
      (1..temp).each { numeral << 'I' }
    end
    numeral
  end
end

module BookKeeping
  VERSION = 2
end
