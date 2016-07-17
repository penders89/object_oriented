class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end


# @@cats_count keeps track of how many instances of Cat have been created
# can check by

Cat.new("shorthair")
Cat.new("sphinx")
Cat.new("sphinx")
puts Cat.cats_count