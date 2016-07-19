class Octal
  
  def initialize(oct)
    @oct = oct
  end
  
  def to_decimal
    arr = @oct.chars.map(&:to_i)
    if @oct.to_i == 0 || arr.include?(8) || arr.include?(9)
      return 0 
    end
    num = 0
    arr.each_with_index do |val, idx|
      num += val * 8**(arr.length - idx - 1)
    end
    num
  end
  
  
  
end