class Vehicle

  
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

class MyCar < Vehicle
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
end

class MyTruck < Vehicle
  def initialize(size, color)
    @size = size
    @color = color
    @speed = 0
  end
  
  def to_s
    "This truck is #{@size} and #{@color}"
  end
  
end

polo = MyCar.new(1997,"red","polo")

puts polo

polo.speed_up
polo.brake
polo.shut_off

big_truck = MyTruck.new("massive","purple")
puts big_truck
big_truck.speed_up
