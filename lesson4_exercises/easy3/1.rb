class Greeting
  def greet(message)
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

hello = Hello.new
hello.hi
# prints hello

hello = Hello.new
# hello.bye
# can't find method


hello = Hello.new
# hello.greet
# incorrect raguments error


hello = Hello.new
hello.greet("Goodbye")
# will print goodbye

Hello.hi
# error, no class method