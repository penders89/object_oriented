class Luhn
  def initialize(num)
    @num = num
  end
  
  def addends
    arr = @num.to_s.split('').map(&:to_i)
    new_arr = []
    arr.each_with_index do |val, idx|
      if arr.size % 2 == 0 && idx % 2 == 0 ||
          arr.size % 2 != 0 && idx % 2 != 0
        new_arr.push(special_double(val))
      else
        new_arr.push(val)
      end
    end
    new_arr
  end
  
  def special_double(val)
    if val*2 < 10
      return val*2
    else
      return val*2 - 9
    end
  end
  
  def checksum
    addends.reduce(&:+)
  end
  
  def remainder
    checksum % 10
  end
  
  def valid?
    remainder == 0
  end
  
  def self.create(num)
    luhn = Luhn.new(num*10)
    luhn.valid? ? num*10 : (num.to_s + (10-luhn.remainder).to_s).to_i
  end
end