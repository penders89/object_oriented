class Greeting
  def greet(message)
    puts message
  end
  
  
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
  


class Hello < Greeting
  def hi
    greet("Hello")
  end
  
  def self.hi
    self.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# calling Hello.hi gets an error message
# can fix by adding class method

Hello.hi