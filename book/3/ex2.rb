class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end
  
  def to_s
     "This is a #{year} #{color} #{@model}"
  end
  
  def speed_up
    @speed += 5
    puts "You speed up to #{@speed}"
  end
  
  def brake
    @speed -= 5 if @speed != 0
    puts "You slow down to #{@speed}"
  end
  
  def shut_off
    @speed = 0
    puts "You have now stopped"
  end
  
  def self.gas_mileage(gallon, miles)
    mpg = miles/gallon
    puts "The mpg is #{mpg}"
  end
end

polo = MyCar.new(1997,"red","polo")

puts polo

puts "will this interpolate #{polo}"