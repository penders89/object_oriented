# Graduate students have the option to use on-campus parking, while Undergraduate students will not.

# Graduate and Undergraduate students have a name and year associated with them.


class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student

end

g = Graduate.new("tim", 2001, "west wing")
u = Undergraduate.new("rob", 1997)
p g
p u