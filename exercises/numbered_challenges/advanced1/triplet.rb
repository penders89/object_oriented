class Triplet
  def initialize(a,b,c)
    @a, @b, @c = a, b, c

  end
  
  def sum
    @a + @b + @c
  end
  
  def product
    @a * @b * @c
  end
  
  def pythagorean?
    @a ** 2 + @b ** 2 == @c ** 2
  end
  
  def self.where(arg)
    @max_factor = arg[:max_factor]
    @min_factor = arg[:min_factor] || 1
    @sum = arg[:sum] || nil
    results = []
    (@min_factor..@max_factor).to_a.repeated_combination(3) do |x,y,z|
      if x**2 + y**2 == z**2 && ( !@sum || (x + y + z == @sum) )
        results << Triplet.new(x,y,z)
      end
    end
    results
  end
        
    
  
end

