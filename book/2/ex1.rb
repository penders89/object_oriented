class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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
end

polo = MyCar.new(2001, "pink", polo)


def spray_paint(car, new_color)
  car.color = new_color
end


puts polo.color
spray_paint(polo, "red")
puts polo.color