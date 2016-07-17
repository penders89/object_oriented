class Greeting
  def greet(message)
    puts "This is your message: #{message}"
  end
end

class Hello < Greeting
  def hi
    greet("hello")
  end
end


class Goodbye < Greeting
  def goodbye
   greet("goodbye") 
  end
end

h = Hello.new
h.hi

g = Goodbye.new
g.goodbye