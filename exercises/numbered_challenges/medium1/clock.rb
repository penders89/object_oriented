require 'pry'
class Clock
  attr_accessor :hour, :min
  
  def initialize(hour, min)
    @hour = hour.to_s
    @min = min.to_s
  end
  
  def self.at(hour,min = "00")
    Clock.new(hour, min)
  end
  
  def to_s
    str = ""
    if hour.length == 2
      str << "#{hour}:"
    else
      str << "0#{hour}:"
    end
    if min.length == 2
      str << min
    else
      str << "0#{min}"
    end
  str
  end
  
  def +(extra_mins)
    new_hour += ((@min.to_i + extra_mins ) / 60) % 24
    new_min += (@min.to_i + etra_mins) % 60
    Clock.at(new_hour, new_min)
  end
  
end

p Clock.at(10)
#binding.pry
p Clock.at(10).+(2)
