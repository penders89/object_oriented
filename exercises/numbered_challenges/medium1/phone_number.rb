class PhoneNumber
  BAD_NUMBER = "0" * 10
  
  def initialize(number)
    @number = number
  end
  
  def number
    return BAD_NUMBER if /[a-z]/i =~ @number 
    
    @clean_number = @number.gsub(/[^\d]/, '')
    if @clean_number.length == 10
      return @clean_number
    elsif (@clean_number.length == 11) && (@clean_number[0] == "1")
      return @clean_number[1..-1]
    else
      return BAD_NUMBER
    end
  end
  
  def area_code
    number[0..2]
  end
  
  def rest_of
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..-1]}"
  end
end

