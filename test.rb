class Person
  def initialize(name)
    @name = name
  end
end

joe = Person.new("joe")
joe2 = Person.new("joe")

puts joe == joe2