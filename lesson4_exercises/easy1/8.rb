class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# here, self means we are able to "set" the instance variable @age
# without the self reference, it would think it was creating a local variable